require 'rails_helper'

RSpec.describe Customers::InviteService, type: :service do
  let(:valid_file_path) { Rails.root.join('spec', 'fixtures', 'files', 'valid_customers.txt') }
  let(:invalid_file_path) { Rails.root.join('spec', 'fixtures', 'files', 'invalid_customers.txt') }

  describe '#call' do
    context 'with valid customer file' do
      it 'returns customers within 100km sorted by user_id' do
        service = described_class.new(File.open(valid_file_path))
        result = service.call

        expect(result).to all(include(:user_id, :name))
        expect(result).to eq(result.sort_by { |c| c[:user_id] })
        expect(result.count).to be > 0
      end
    end

    context 'with invalid customer file' do
      it 'raises an InvalidFileError' do
        service = described_class.new(File.open(invalid_file_path))

        expect { service.call }.to raise_error(Customers::InviteService::InvalidFileError)
      end
    end
  end
end