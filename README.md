# NewsExplorer

# Test task for Teamvoy

## Use cases:
- User can view the list of articles (each item should contain next info: title, description)
- User can sort articles by available params
- User can select an article from the list and view detailed information(image, title, description, author, source, published at)
- User can search in articles by word
- User can search articles for some time period

## API -> [NewsApi](https://newsapi.org)

## My workflow:
- create Model and sub structures (SearchInOption, LanguageOption)
- create service to fetch news [NewsAPIService](https://github.com/ToBiSiD/NewsExplorer/blob/main/NewsExplorerTeamvoy/API/NewsAPIService.swift)
- create base Views
- add animations: [TextWithAnimatedDots](https://github.com/ToBiSiD/NewsExplorer/blob/main/NewsExplorerTeamvoy/View/Components/AnimatedTextWithDotsView.swift), [LoadingCircle](https://github.com/ToBiSiD/NewsExplorer/blob/main/NewsExplorerTeamvoy/View/Components/SpinningCircle.swift)
- add Utils classes and Extensions  
- customize Views using Color Sets

