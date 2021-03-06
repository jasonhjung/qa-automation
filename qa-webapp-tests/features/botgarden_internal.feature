Feature: Test the behavior of the Botgarden internal portal

Scenario: Test Internal Search Portal
    Given I am on the "botgarden" homepage
    Then I will sign in
    Then I click app "internal"
    Then I verify the search fields "Accession Number, Scientific Name, Family, Collector Number, Collection Date, Field Collection Place, County, State, Country, Flower Color, Flowering (months), Fruiting (months), Infraspecific Epithet, Access Restrictions, Specific Epithet, Rank Marker" in "div#searchfieldsTarget"

    When I enter "dry" in the "habitat" field
    Then I click on "Dry arid succulent bush" in the dropdown menu and search
    Then I find the content "Dry arid succulent bush" in "input#habitat"
    Then I will click "Reset" and the "habitat" field should have ""

    When I enter "jan" in "fruiting" and click "List"
    Then I verify the table headers "Accession Number, Scientific Name, Rare?, Dead?, Flower Color"
    Then I will click the arrows to toggle between pages
    Then I click the button "download selected as csv" and download the csv file

    When I click "Maps"
    Then I verify the maps buttons
    When I click the button "map selected with Google staticmaps API"
    Then I find the content "selected objects in result set examined." in "div#maps"
    When I click the button "map selected with Berkeley Mapper"
    #Then the url contains "http://berkeleymapper.berkeley.edu"

    When I click "Statistics"
    Then I will select "Geographic Place Name" under Select field to summarize on
    Then I find the content "Geographic Place Name, Count" in "div#statsresults"
    Then I click the button "downloadstats" and download the csv file

    When I click "Facets"
    Then I find the content "Collector Number, County, State, Country, Family, Garden Location, Rare?, Dead?, Flower Color" in "div#tabs"
    Then I will click the up and down arrows beside the headers without knowing table name
    Then I will click on a value "ORCHIDACEAE" and see it appear in the field "family"
    Then I will click "Reset" and the "family" field should have "Please select"

    When I enter "belladonna" in "keyword" and click "Full"
    Then I will click the arrows to toggle between pages
    Then I click the button "download selected as csv" and download the csv file
    Then I find the content "Current time:" in "div#container"
    When I find the content "About, Help, Credits" in "div#branding"
