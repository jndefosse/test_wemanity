# Test Wemanity
Project for a dev test for Wemanity

Test based on https://github.com/emilybache/GildedRose-Refactoring-Kata

To test the code, 
1. Download the code from github
2. Open it on Xcode 12
3. You can directly run the app on simulator. Print will display on Xcode terminal view.
4. You can run WemanityTests to check Unit Test

How i made this test?
The first thing i did was to create the clean architecture (Data - Domain - Presentation). 
I create on Domain the model Item, a repository ItemRepository and a usecase UpdateItemsQuality. 
I create on Data the InMemoryItemRepository with the code to update items quality from the Gilded Rose.
I move on Presentation the ViewController with the loop code who update items with the update of days.
Before start the refactoring, i create tests on WemanityTests with all cases present on the ReadMe.
When tests passed, i attack the refactoring by creating a ItemType Class with 4 sub class to manage differents cases.
For the Conjured type, i created the test first (TDD Methods) and i code the logic after on the class Conjured Item.
