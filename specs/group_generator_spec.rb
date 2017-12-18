require 'minitest/autorun'
require 'pry'
require_relative '../group_generator.rb'

describe GroupGenerator do
  def fetch_participants(file_storage_path)
    File.readlines(file_storage_path).map { |line| line.strip }
  end

  def group_count_assertion(participants, expected_group_count)
    GroupGenerator.generate_groups(participants)
      .map(&:count)
      .must_equal(expected_group_count)
  end

  describe 'add new participants'do
    before do
      @file_path = './specs/foo.txt'
    end

    after do
      File.open(@file_path, 'w') do |file|
        file.puts 'Doug Fresh'
        file.puts 'Sam'
        file.puts 'Judy'
        file.puts 'Eunice'
      end
    end

    it 'appends name to end of file' do
      participants = fetch_participants(@file_path)
      participants.count.must_equal 4

      GroupGenerator.add_new_lunchers(['Green', 'Eggs'], @file_path)

      participants = fetch_participants(@file_path)
      participants.count.must_equal 6
      participants.last.must_equal 'Eggs'
    end
  end

  describe 'creates group' do
    describe 'when participant count is less than 3' do
      it 'returns all current participants when count is less than 3' do
        participants = ['John', 'Jen']

        group_count_assertion(participants, [2])
      end
    end

    describe 'with arbitrary number of participants' do
      it '3 participants' do
        participants = ['foo'] * 3

        group_count_assertion(participants, [3])
      end

      it '4 participants' do
        participants = ['foo'] * 3

        group_count_assertion(participants, [3])
      end

      it '5 participants' do
        participants = ['foo'] * 3

        group_count_assertion(participants, [3])
      end

      it '7 participants' do
        participants = ['foo'] * 7

        group_count_assertion(participants, [3,4])
      end

      it '10 participants' do
        participants = ['foo'] * 10

        group_count_assertion(participants, [3,3,4])
      end

      it '11 participants' do
        participants = ['foo'] * 11

        group_count_assertion(participants, [3,4,4])
      end

      it '12 participants' do
        participants = ['foo'] * 12

        group_count_assertion(participants, [3,3,3,3])
      end

      it '13 participants' do
        participants = ['foo'] * 13

        group_count_assertion(participants, [3,3,3,4])
      end
    end
  end
end
