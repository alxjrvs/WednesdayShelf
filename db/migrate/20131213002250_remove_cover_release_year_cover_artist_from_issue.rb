class RemoveCoverReleaseYearCoverArtistFromIssue < ActiveRecord::Migration
  def change
    remove_column :issues, :cover
    remove_column :issues, :release_year
    remove_column :issues, :cover_artist
    remove_column :issues, :series_title
  end
end
