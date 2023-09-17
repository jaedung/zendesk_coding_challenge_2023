SEARCHABLE_ENTITIES = [
  {
    name: 'organizations',
    fields: [
      '_id',
      'url',
      'external_id',
      'name',
      'domain_names',
      'details',
      'shared_tickets',
      'tags'
    ]
  },
  {
    name: 'tickets',
    fields: [
      '_id',
      'url',
      'external_id',
      'type',
      'subject',
      'description',
      'priority',
      'status',
      'submitter_id',
      'assignee_id',
      'organization_id',
      'tags',
      'has_incidents',
      'via'
    ]
  },
  {
    name: 'users',
    fields: [
      '_id',
      'url',
      'external_id',
      'name',
      'alias',
      'active',
      'verified',
      'shared',
      'locale',
      'timezone',
      'email',
      'phone',
      'signature',
      'organization_id',
      'tags',
      'suspended',
      'role'
    ]
  },
].freeze
