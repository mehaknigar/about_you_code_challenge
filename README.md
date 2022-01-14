# AboutYou Code Challenge

## Requirements

> Given a list of contact names (as `List<String>` for demo purposes), render an address book list where the names are grouped by their first character.

### Basic

- [x] Implementation should be done in its own Widget
    - [x] We expect a `GroupedListView` widget which receives the items
    - [x] Make this widget generic and be able to work with any data type, given the appropriate builder is provided
    - [x] It should be a single, continuous list widget
    - [x] Preferably this scroll view should be using `Slivers` and a `CustomScrollView`
    - [x] In the end, all data should be displayed in one continuous scrolling list
    - [x] Only visible items should be rendered (expect huge amounts of test data and a requirement to show images next to each contact)
- [x] Use any styling you want, stock Material widgets are fine
- [x] Only show groups that have entries
- [x] Each entry should be tappable (next screen may just show the name in "detail view"

### Additional

- [x] There should be the ability to show widgets on the top and below the list
    - For this challenge, we only want to inject a vertical list of buttons
- [x] A search field should be provided to filter down the list
    -  When a search is active, the additional widgets should be hidden
- [x] Describe why a Scroll to index API is not as straightforward with normal `ListView` or `Sliver` widgets in the README of the project
- [x] Please finish your coding challenge with a short README outlining your thinking behind the implementation and any open issues you would want to explore if there were more time.

## Implementation

### Design

The goal of the this app  is to **display a list of contacts** provided by either a local or remote data source.In this I used Custom list.Another way to implement the list can  be done through calling data from server but as main purpose was to display the list names  grouped by their first character so I used custom list.Also the ability to **search/filter for specific contact** is done.Also on tapping the tiles further **access further information** is opened.

The graphical interface is designed using Material Design. Keeping in mind these certain platform looks , I designed Theme buttons , Icons , Tiles etc. Added Certain platform-defining characteristics so that a unified look is conveyed.

### Architecture
To interact with flutter through the flutter framework as it provides a modern framework in the Dart Language.The project is divided into different layers:

**1 Presentation Layer**

This layer contains reactive widgets.This draw structural, platform, and interactive widgets visual components to the screen .
[widgets](https://flutter.dev/docs/development/ui/widgets)

**2 Logic**

In this project the main thing was to create a list using custom scroll view .So I created a group widget in which three arugments are being passed
i- List
ii-Top Widget
iii- Bottom Widget

Then seprate widgets are created inorder to handle the passing of data i.e list and searching .The top widget is using expandable widget which is further showing list of buttons
,similarly the bottom widget is also showing the list of buttons.
The list is using custom and sliver scroll and is scroll very smoothly

**3 Data Source**

Data can be reterived either local and remote source . In this project , data is coming locally within application.

### Highlights

- Layered architecture
- App theming ( `AppTheme` and `Styles`)
- Custom Contact Name List
- Custom Scroll List
- Support for `header` and `footer` slivers in the `GroupedListView`
- Use of Media Query 
- Use of set state management(As list was custom so this method works)
- widgets when scroll through conent
- Separation of the app bar widget
- Flutter toast plugins
- Search capabilities
- The UI is compatible with any smartphone screen size and orientation 
- Unit tested

### Dependencies

For this project I only used these three dependencies

  [cupertino_icons: ^1.0.2]
  
  [expand_widget: ^2.1.0]
  
  [fluttertoast: ^8.0.8]
 
 ## Question 
 
**Describe why a Scroll to index API is not as straightforward with normal ListView or Sliver widgets ** 
 
 In Flutter, scroll to index is not as straightforward with `ListView` or `Slivers` because these widgets may contain items with distinct measures. 
 
 ## Running the project

This project requires flutter to be installed in your machine. 

Once you have flutter, all you need to do is:
1. Open an Android or iOS simulator
2. Clone this repo to somewhere in your machine 
3. Go to your folder
4. Run the project!


## Note 
A video recording is added in the screen folder and also images.

**Through main page the 3 aruguments are being passed.

**The constant file contains some constant variables.

**The top_bottom_widget contain the widget for top and bottom which is expanding further and showing list of buttons.

**In the contact item folders, 2 files are present .The aplha group list takes the three arguments and pass it further to custom scroll and sliver and from their clicking on the contact you can view the contact.
 


