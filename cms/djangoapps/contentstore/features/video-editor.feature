@shard_3
Feature: CMS Video Component Editor
  As a course author, I want to be able to create video components

  # 1
  Scenario: User can view Video metadata
    Given I have created a Video component
    And I edit the component
    Then I see the correct video settings and default values

  # 2
  # Safari has trouble saving values on Sauce
  @skip_safari
  Scenario: User can modify Video display name
    Given I have created a Video component
    And I edit the component
    Then I can modify the display name
    And my video display name change is persisted on save

  # 3
  # Sauce Labs cannot delete cookies
  @skip_sauce
  Scenario: Captions are hidden when "transcript display" is false
    Given I have created a Video component with subtitles
    And I have set "transcript display" to False
    Then when I view the video it does not show the captions

  # 4
  # Sauce Labs cannot delete cookies
  @skip_sauce
  Scenario: Captions are shown when "transcript display" is true
    Given I have created a Video component with subtitles
    And I have set "transcript display" to True
    Then when I view the video it does show the captions

  # 5
  Scenario: Transcripts uploading works correctly
    Given I have created a Video component
    And I edit the component
    And I open tab "Advanced"
    And I upload transcript files:
      |lang_code|filename               |
      |zh       |chinese_transcripts.srt|
    And I save changes
    Then when I view the video it does show the captions
    And I see "好 各位同学" text in the captions

  # 6
  Scenario: Transcripts downloading works correctly
    Given I have created a Video component
    And I edit the component
    And I open tab "Advanced"
    And I upload transcript files:
      |lang_code|filename               |
      |zh       |chinese_transcripts.srt|
      |uk       |test_transcripts.srt   |
    Then I can download transcript for "zh" language code, that contains text "好 各位同学"
    And I can download transcript for "uk" language code, that contains text "Hi, welcome to Edx."

  # 7
  Scenario: Transcripts removing works correctly
    Given I have created a Video component
    And I edit the component
    And I open tab "Advanced"
    And I upload transcript files:
      |lang_code|filename               |
      |zh       |chinese_transcripts.srt|
      |uk       |test_transcripts.srt   |
    And I save changes
    And I edit the component
    And I open tab "Advanced"
    Then when I view the video it does show the captions
    And I see "好 各位同学" text in the captions
    Then I click on remove button for "zh" language code
    And I confirm prompt
    And I save changes
    Then when I view the video it does show the captions
    And I see "Hi, welcome to Edx." text in the captions
    And I edit the component
    And I open tab "Advanced"
    And I see translations for "uk"
    Then I click on remove button for "uk" language code
    And I confirm prompt
    And I save changes
    Then when I view the video it does not show the captions

  # 8
  Scenario: Transcripts clearing works correctly
    Given I have created a Video component
    And I edit the component
    And I open tab "Advanced"
    And I upload transcript files:
      |lang_code|filename               |
      |zh       |chinese_transcripts.srt|
      |uk       |test_transcripts.srt   |
    And I save changes
    And I edit the component
    And I open tab "Advanced"
    Then when I view the video it does show the captions
    And I click on clear button
    And I confirm prompt
    And I save changes
    Then when I view the video it does not show the captions
