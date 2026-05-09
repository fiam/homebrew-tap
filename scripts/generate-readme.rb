#!/usr/bin/env ruby
# frozen_string_literal: true

FormulaEntry = Struct.new(:kind, :token, :name, :version, :description, :homepage, keyword_init: true)

def ruby_string_value(line, key)
  match = line.match(/^\s*#{Regexp.escape(key)}\s+"((?:\\"|[^"])*)"/)
  return "" unless match

  match[1].gsub('\"', '"')
end

def entry_from(path, kind)
  text = File.read(path)
  token_pattern = kind == "formula" ? /^\s*class\s+([A-Za-z0-9_]+)\s+<\s+Formula/ : /^\s*cask\s+"([^"]+)"/
  token_match = text.match(token_pattern)
  token = if kind == "formula"
            File.basename(path, ".rb")
          else
            token_match&.[](1) || File.basename(path, ".rb")
          end
  name = text.each_line.map { |line| ruby_string_value(line, "name") }.find { |value| !value.empty? } || token
  desc = text.each_line.map { |line| ruby_string_value(line, "desc") }.find { |value| !value.empty? } || ""
  homepage = text.each_line.map { |line| ruby_string_value(line, "homepage") }.find { |value| !value.empty? } || ""
  version = text[/^\s*version\s+"([^"]+)"/, 1] || ""

  FormulaEntry.new(
    kind: kind,
    token: token,
    name: name,
    version: version,
    description: desc,
    homepage: homepage
  )
end

def entries(pattern, kind)
  Dir.glob(pattern).sort.map { |path| entry_from(path, kind) }
end

def escape_markdown(value)
  value.to_s.gsub("|", "\\|")
end

def link(entry)
  label = escape_markdown(entry.name)
  return label if entry.homepage.empty?

  "[#{label}](#{entry.homepage})"
end

def table(entries, cask:)
  return "_None yet._\n" if entries.empty?

  rows = entries.map do |entry|
    command = cask ? "brew install --cask fiam/tap/#{entry.token}" : "brew install fiam/tap/#{entry.token}"
    "| #{link(entry)} | #{escape_markdown(entry.version)} | #{escape_markdown(entry.description)} | `#{command}` |"
  end

  (["| Name | Version | Description | Install |", "| --- | --- | --- | --- |"] + rows).join("\n") + "\n"
end

formulae = entries("Formula/*.rb", "formula")
casks = entries("Casks/*.rb", "cask")

readme = <<~README
  # fiam Homebrew Tap

  Homebrew tap for apps and command-line tools from [fiam](https://github.com/fiam).

  This README is generated from the tap's formulae and casks.

  ## Setup

  ```bash
  brew tap fiam/tap
  ```

  ## Formulae

  #{table(formulae, cask: false)}
  ## Casks

  #{table(casks, cask: true)}
  ## Maintenance

  Formulae and casks in this tap are updated automatically by their respective
  release workflows. The README is regenerated automatically when tap contents
  change.
README

File.write("README.md", readme)
