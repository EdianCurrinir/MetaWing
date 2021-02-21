module Rankers
  class GenericRanker
    attr_reader :start_date, :end_date, :tournament_type, :game_format

    def initialize(start_date, end_date, tournament_type, game_format)
      @start_date      = start_date
      @end_date        = end_date
      @tournament_type = tournament_type
      @game_format = game_format
    end

    def numbers
      tournaments = Tournament.where('tournaments.date >= ? and tournaments.date <= ?', start_date, end_date)

      tournaments = tournaments.where('tournaments.tournament_type_id = ?', tournament_type) if tournament_type.present?
      tournaments = tournaments.where('tournaments.format_id = ?', game_format) if game_format.present?

      squadrons = Squadron.joins(:tournament).merge(tournaments)
      return tournaments.count, squadrons.count
    end
  end
end
