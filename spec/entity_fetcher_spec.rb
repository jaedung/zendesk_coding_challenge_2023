describe EntityFetcher do
  let(:organizations) { JSON.parse(File.read('data/organizations.json')) }
  let(:tickets) { JSON.parse(File.read('data/tickets.json')) }
  let(:users) { JSON.parse(File.read('data/users.json')) }
  let(:data) {
    { organizations: organizations, tickets: tickets, users: users }
  }

  let(:entity_name) { 'organizations' } # users, tickets
  let(:search_term) { '_id' }
  let(:search_value) { 1 }

  let(:subject) {
    described_class.new(
      data: data,
      entity_name: entity_name,
      search_term: search_term,
      search_value: search_value
    )
  }

  context 'when entity_name is organizations' do
    let(:entity_name) { 'organizations' }

    context 'and when search_term is _id' do
      let(:search_term) { '_id' }
      let(:search_value) { '101' }

      it 'returns organizations on _id' do
        results = subject.run
        expect(results[0]['_id']).to eq search_value.to_i
      end
    end

    context 'and when search_term is url' do
      let(:search_term) { 'url' }
      let(:search_value) { 'http://initech.zendesk.com/api/v2/organizations/101.json' }

      it 'returns organizations on url' do
        results = subject.run
        expect(results[0]['url']).to eq search_value
      end
    end

    context 'and when search_term is external_id' do
      let(:search_term) { 'external_id' }
      let(:search_value) { '9270ed79-35eb-4a38-a46f-35725197ea8d' }

      it 'returns organizations on external_id' do
        results = subject.run
        expect(results[0]['external_id']).to eq search_value
      end
    end

    context 'and when search_term is name' do
      let(:search_term) { 'name' }
      let(:search_value) { 'Enthaze' }

      it 'returns organizations on name' do
        results = subject.run
        expect(results[0]['name']).to eq search_value
      end
    end

    context 'and when search_term is domain_names' do
      let(:search_term) { 'domain_names' }
      let(:search_value) { 'kage.com' }

      it 'returns organizations on domain_names' do
        results = subject.run
        expect(results[0]['domain_names']).to include search_value
      end
    end

    context 'and when search_term is details' do
      let(:search_term) { 'details' }
      let(:search_value) { 'MegaCorp' }

      it 'returns organizations on details' do
        results = subject.run
        expect(results[0]['details']).to eq search_value
      end
    end

    context 'and when search_term is shared_tickets' do
      let(:search_term) { 'shared_tickets' }
      let(:search_value) { 'false' }

      it 'returns organizations on shared_tickets' do
        results = subject.run
        expect(results[0]['shared_tickets'].to_s).to eq search_value
      end
    end

    context 'and when search_term is tags' do
      let(:search_term) { 'tags' }
      let(:search_value) { 'Fulton' }

      it 'returns organizations on tags' do
        results = subject.run
        expect(results[0]['tags']).to include search_value
      end
    end
  end

  context 'when entity_name is users' do
    let(:entity_name) { 'users' }

    context 'and when search_term is _id' do
      let(:search_term) { '_id' }
      let(:search_value) { '1' }

      it 'returns users on _id' do
        results = subject.run
        expect(results[0]['_id']).to eq search_value.to_i
      end
    end

    context 'and when search_term is url' do
      let(:search_term) { 'url' }
      let(:search_value) { 'http://initech.zendesk.com/api/v2/users/1.json' }

      it 'returns users on url' do
        results = subject.run
        expect(results[0]['url']).to eq search_value
      end
    end

    context 'and when search_term is external_id' do
      let(:search_term) { 'external_id' }
      let(:search_value) { '74341f74-9c79-49d5-9611-87ef9b6eb75f' }

      it 'returns users on external_id' do
        results = subject.run
        expect(results[0]['external_id']).to eq search_value
      end
    end

    context 'and when search_term is name' do
      let(:search_term) { 'name' }
      let(:search_value) { 'Francisca Rasmussen' }

      it 'returns users on name' do
        results = subject.run
        expect(results[0]['name']).to eq search_value
      end
    end

    context 'and when search_term is alias' do
      let(:search_term) { 'alias' }
      let(:search_value) { 'Miss Coffey' }

      it 'returns users on alias' do
        results = subject.run
        expect(results[0]['alias']).to eq search_value
      end
    end

    context 'and when search_term is active' do
      let(:search_term) { 'active' }
      let(:search_value) { 'true' }

      it 'returns users on active' do
        results = subject.run
        expect(results[0]['active'].to_s).to eq search_value
      end
    end

    context 'and when search_term is verified' do
      let(:search_term) { 'verified' }
      let(:search_value) { 'true' }

      it 'returns users on verified' do
        results = subject.run
        expect(results[0]['verified'].to_s).to eq search_value
      end
    end

    context 'and when search_term is shared' do
      let(:search_term) { 'shared' }
      let(:search_value) { 'false' }

      it 'returns users on shared' do
        results = subject.run
        expect(results[0]['shared'].to_s).to eq search_value
      end
    end

    context 'and when search_term is locale' do
      let(:search_term) { 'locale' }
      let(:search_value) { 'en-AU' }

      it 'returns users on locale' do
        results = subject.run
        expect(results[0]['locale']).to eq search_value
      end
    end

    context 'and when search_term is timezone' do
      let(:search_term) { 'timezone' }
      let(:search_value) { 'Sri Lanka' }

      it 'returns users on timezone' do
        results = subject.run
        expect(results[0]['timezone']).to eq search_value
      end
    end

    context 'and when search_term is email' do
      let(:search_term) { 'email' }
      let(:search_value) { 'michaelburt@flotonic.com' }

      it 'returns users on email' do
        results = subject.run
        expect(results[0]['email']).to eq search_value
      end
    end

    context 'and when search_term is phone' do
      let(:search_term) { 'phone' }
      let(:search_value) { '9685-703-824' }

      it 'returns users on phone' do
        results = subject.run
        expect(results[0]['phone']).to eq search_value
      end
    end

    context 'and when search_term is signature' do
      let(:search_term) { 'signature' }
      let(:search_value) { "Don't Worry Be Happy!" }

      it 'returns users on signature' do
        results = subject.run
        expect(results[0]['signature']).to eq search_value
      end
    end

    context 'and when search_term is tags' do
      let(:search_term) { 'tags' }
      let(:search_value) { 'Wollochet' }

      it 'returns users on tags' do
        results = subject.run
        expect(results[0]['tags']).to include search_value
      end
    end

    context 'and when search_term is suspended' do
      let(:search_term) { 'suspended' }
      let(:search_value) { 'false' }

      it 'returns users on suspended' do
        results = subject.run
        expect(results[0]['suspended'].to_s).to eq search_value
      end
    end

    context 'and when search_term is role' do
      let(:search_term) { 'role' }
      let(:search_value) { 'agent' }

      it 'returns users on role' do
        results = subject.run
        expect(results[0]['role']).to eq search_value
      end
    end
  end

  context 'when entity_name is tickets' do
    let(:entity_name) { 'tickets' }

    context 'and when search_term is _id' do
      let(:search_term) { '_id' }
      let(:search_value) { '436bf9b0-1147-4c0a-8439-6f79833bff5b' }

      it 'returns tickets on _id' do
        results = subject.run
        expect(results[0]['_id']).to eq search_value
      end
    end

    context 'and when search_term is url' do
      let(:search_term) { 'url' }
      let(:search_value) { 'http://initech.zendesk.com/api/v2/tickets/436bf9b0-1147-4c0a-8439-6f79833bff5b.json' }

      it 'returns tickets on url' do
        results = subject.run
        expect(results[0]['url']).to eq search_value
      end
    end

    context 'and when search_term is external_id' do
      let(:search_term) { 'external_id' }
      let(:search_value) { '9210cdc9-4bee-485f-a078-35396cd74063' }

      it 'returns tickets on external_id' do
        results = subject.run
        expect(results[0]['external_id']).to eq search_value
      end
    end

    context 'and when search_term is type' do
      let(:search_term) { 'type' }
      let(:search_value) { 'incident' }

      it 'returns tickets on type' do
        results = subject.run
        expect(results[0]['type']).to eq search_value
      end
    end

    context 'and when search_term is subject' do
      let(:search_term) { 'subject' }
      let(:search_value) { 'A Catastrophe in Korea (North)' }

      it 'returns tickets on subject' do
        results = subject.run
        expect(results[0]['subject']).to eq search_value
      end
    end

    context 'and when search_term is description' do
      let(:search_term) { 'description' }
      let(:search_value) { 'Nostrud ad sit velit cupidatat laboris ipsum nisi amet laboris ex exercitation amet et proident. Ipsum fugiat aute dolore tempor nostrud velit ipsum.' }

      context 'and when description is empty' do
        let(:search_value) { '' }

        it 'returns tickets on description' do
          results = subject.run
          expect(results[0]['description']).to eq nil
        end
      end

      context 'and when description is NOT empty' do
        let(:search_value) { 'Nostrud ad sit velit cupidatat laboris ipsum nisi amet laboris ex exercitation amet et proident. Ipsum fugiat aute dolore tempor nostrud velit ipsum.' }

        it 'returns tickets on description' do
          results = subject.run
          expect(results[0]['description']).to eq search_value
        end
      end
    end

    context 'and when search_term is priority' do
      let(:search_term) { 'priority' }
      let(:search_value) { 'high' }

      it 'returns tickets on priority' do
        results = subject.run
        expect(results[0]['priority']).to eq search_value
      end
    end

    context 'and when search_term is status' do
      let(:search_term) { 'status' }
      let(:search_value) { 'pending' }

      it 'returns tickets on status' do
        results = subject.run
        expect(results[0]['status']).to eq search_value
      end
    end

    context 'and when search_term is submitter_id' do
      let(:search_term) { 'submitter_id' }
      let(:search_value) { '38' }

      it 'returns tickets on submitter_id' do
        results = subject.run
        expect(results[0]['submitter_id'].to_s).to eq search_value
      end
    end

    context 'and when search_term is assignee_id' do
      let(:search_term) { 'assignee_id' }
      let(:search_value) { '24' }

      it 'returns tickets on assignee_id' do
        results = subject.run
        expect(results[0]['assignee_id'].to_s).to eq search_value
      end
    end

    context 'and when search_term is organization_id' do
      let(:search_term) { 'organization_id' }
      let(:search_value) { '116' }

      it 'returns tickets on organization_id' do
        results = subject.run
        expect(results[0]['organization_id'].to_s).to eq search_value
      end
    end

    context 'and when search_term is tags' do
      let(:search_term) { 'tags' }
      let(:search_value) { 'Ohio' }

      it 'returns tickets on tags' do
        results = subject.run
        expect(results[0]['tags']).to include search_value
      end
    end

  context 'and when search_term is has_incidents' do
      let(:search_term) { 'has_incidents' }
      let(:search_value) { 'false' }

      it 'returns tickets on has_incidents' do
        results = subject.run
        expect(results[0]['has_incidents'].to_s).to eq search_value
      end
    end

    context 'and when search_term is via' do
      let(:search_term) { 'via' }
      let(:search_value) { 'web' }

      it 'returns tickets on via' do
        results = subject.run
        expect(results[0]['via']).to eq search_value
      end
    end
  end
end
