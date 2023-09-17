class EntityFetcher
  def initialize(data:, entity_name:, search_term:, search_value:)
    @data = data
    @entity_name = entity_name # organizations, users, tickets
    @search_term = search_term
    @search_value = search_value
  end

  def run
    results = @data[@entity_name.to_sym].select do |item|
      entity_value = item[@search_term]

      if entity_value.is_a?(Array) && entity_value.all? { |element| element.is_a?(String) }
        entity_value.include?(@search_value)
      else
        entity_value.to_s.downcase == @search_value.downcase.gsub("\"", '')
      end
    end

    results.each do |result|
      search_associated_entities(result)
    end

    results
  end

  private

  def search_associated_entities(result)
    users = @data[:users]
    tickets = @data[:tickets]
    organizations = @data[:organizations]

    case @entity_name
    when 'organizations'
      matching_users = users.select { |user| user['organization_id'] == result['_id'] }
      matching_users.each do |matching_user|
        result['user'] = "#{matching_user['name']} (ID: #{matching_user['_id']})"
      end

      matching_tickets = tickets.select { |ticket| ticket['organization_id'] == result['_id'] }
      matching_tickets.each do |matching_ticket|
        result['ticket'] = "#{matching_ticket['subject']} (ID: #{matching_ticket['_id']})"
      end
    when 'users'
      matching_organization = organizations.find { |organization| organization['_id'] == result['organization_id'] }
      organization = matching_organization.nil? ? 'User does not belong to an organization.' : "#{matching_organization['name']} (ID: #{matching_organization['_id']})"
      result['organization'] = organization

      matching_assigned_tickets = tickets.select { |ticket| ticket['assignee_id'] == result['_id'] }
      matching_assigned_tickets.each do |matching_assigned_ticket|
        result['assigned_ticket'] = "#{matching_assigned_ticket['subject']} (ID: #{matching_assigned_ticket['_id']})"
      end

      matching_submitted_tickets = tickets.select { |ticket| ticket['submitter_id'] == result['_id'] }
      matching_submitted_tickets.each do |matching_submitted_ticket|
        result['submitted_ticket'] = "#{matching_submitted_ticket['subject']} (ID: #{matching_submitted_ticket['_id']})"
      end
    when 'tickets'
      matching_organization = organizations.find { |organization| organization['_id'] == result['organization_id'] }
      organization = matching_organization.nil? ? 'User does not belong to an organization.' : "#{matching_organization['name']} (ID: #{matching_organization['_id']})"
      result['organization'] = organization

      matching_assignee = users.find { |user| user['_id'] == result['assignee_id'] }
      assignee = matching_assignee.nil? ? 'Assignee does not exist.' : "#{matching_assignee['name']} (ID: #{matching_assignee['_id']})"
      result['assignee'] = assignee

      matching_submitter = users.find { |user| user['_id'] == result['submitter_id'] }
      submitter = matching_submitter.nil? ? 'Submitter does not exist.' : "#{matching_submitter['name']} (ID: #{matching_submitter['_id']})"
      result['submitter'] = submitter
    end
  end
end
