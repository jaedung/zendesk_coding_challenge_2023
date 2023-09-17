require 'terminal-table'

require_relative 'constants'
require_relative 'entity_fetcher'

class Menu
  def initialize(prompt)
    @prompt = prompt
    @data = load_data
  end

  def entities_search_menu
    loop do
      entities = %w[Organizations Users Tickets]
      choice = @prompt.select('What would you like to search for?', entities, filter: true, per_page: 50)

      case choice
      when 'Organizations'
        entity_search_menu('organizations')
      when 'Users'
        entity_search_menu('users')
      when 'Tickets'
        entity_search_menu('tickets')
      end
    end
  end

  private

  def load_data
    organizations = JSON.parse(File.read('data/organizations.json'))
    tickets = JSON.parse(File.read('data/tickets.json'))
    users = JSON.parse(File.read('data/users.json'))

    { organizations: organizations, tickets: tickets, users: users }
  end

  def entity_search_menu(entity_name)
    puts
    entity = SEARCHABLE_ENTITIES.find { |searchable_entity| searchable_entity[:name] == entity_name }
    entity_fields = entity[:fields]

    loop do
      search_term = @prompt.select("What field would you like to search in #{entity_name}?", entity_fields, filter: true, per_page: 50)

      if entity_fields.include?(search_term)
        puts

        search_value = @prompt.ask('Enter search value:', default: '').strip

        puts
        puts "Searching #{entity_name} for #{search_term} with a value of #{search_value}"
        puts

        results = EntityFetcher.new(
          data: @data,
          entity_name: entity_name,
          search_term: search_term,
          search_value: search_value
        ).run

        display_search_results(results)
      end
    end
  end

  def display_search_results(results)
    if results.length > 0
      puts 'Results:'
      puts

      results.each do |result|
        rows = []

        result.each do |key, value|
          rows << [key, value]
        end

        table = Terminal::Table.new(rows: rows)
        puts table
      end

      puts
      puts "Total results: #{results.length}"
    else
      puts '*** No results found ***'
    end

    puts
  end
end
