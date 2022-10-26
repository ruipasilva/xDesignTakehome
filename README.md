# xDesignTakehome

This is my entry to the xDesign Take Home Challange.

I've fixed all the documented and most of all undocumented issues. 

I've decided to mix a bit of storyboards, programmatic UI and SwiftUI. I know this, especially SwiftUI, wasn't in the requirements but I've created a very simple detail view for each cell. I've used one the images provided as background.

# Process

1. Create repo
2. Import code to GitHub
3. Commit and push via terminal as I've built the app
    - Find and discover bugs
    - Setup the network call and UI
    - Setup SearchBar
    - Detail View added
    - Error handling
        - Decided to do custom error messages as the only error messages I could see on PostMan were: { "message": "Not authorised" } and { "message":"Not Found" }
    - UI improvements and file organisation
    - Final clean up
4. Review

# Extra Tools

1. PostMan - check the API call response


# If More Time Available

Unfortunately there are 2 things I wish I had more time to research and apply.

1. Unit Testing

2. An algorithm that would make the seasons create a sequence just like the designs and remove the "," at the end of the last season.
    - I've left my starting point in the **CharacterTableViewCell**. It's just func that returns a string. It's not complete but it would be my starting point
    
3. Write a more generic Network Call. 

