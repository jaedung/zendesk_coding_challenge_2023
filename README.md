# Zendesk Melbourne - Coding Challenge

This is a simple command line application written by Ruby to search the data and return the results in a human readable format.

## Getting Started

### Dependencies

- Ruby version (3.2.0)

### Executing program

```
bundle install
```

```
ruby src/app.rb
```

## Testing

```
bundle exec rspec
```

## Assumptions

- It only supports full value matching in every field (e.g. "mar" won't return "mary").

## Libraries

These are the libraries that are required to run this application.

- tty-prompt
- terminal-table
- rspec

## Version History

- 1.0
  - Initial Release
