# NewsExplorer

# Test task for Teamvoy

## Use cases:
- User can view the list of articles (each item should contain next info: title, description)
- User can sort articles by available params
- User can select an article from the list and view detailed information(image, title, description, author, source, published at)
- User can search in articles by word
- User can search articles for some time period

## API: [NewsApi](https://newsapi.org)

## My workflow description:
- create Model and sub structures (SearchInOption, LanguageOption)
- create service to fetch news [NewsAPIService](https://github.com/ToBiSiD/NewsExplorer/blob/main/NewsExplorerTeamvoy/API/NewsAPIService.swift)
- create base Views
- implement user interaction with search settings
- add animations: [TextWithAnimatedDots](https://github.com/ToBiSiD/NewsExplorer/blob/main/NewsExplorerTeamvoy/View/Components/AnimatedTextWithDotsView.swift), [LoadingCircle](https://github.com/ToBiSiD/NewsExplorer/blob/main/NewsExplorerTeamvoy/View/Components/SpinningCircle.swift)
- add Utils classes and Extensions
- customize Views using Color Sets for ![dark Mode](https://drive.google.com/uc?export=view&id=1OAv_6rkOKMdMZ8TxJMZ4YdVZLmjM-Yp8) ![light Mode](https://drive.google.com/uc?export=view&id=1U2STcmGMSudYsYNMOT7IIL-voBSmdeE_)

