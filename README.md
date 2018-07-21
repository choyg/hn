# a worse way of reading hacker news

this is a shallow dive into using flutter for basic app stuff. majority of apps are api clients. can flutter accomplish this common task in an efficient and fun manner? sure.

context: i have developed for both android/ios. android being my stronger suite. i no longer actively develop mobile and wanted to see if flutter was better than my past experiences.

## FLUTTER PROS
* doesn't majorly suck. both android/ios have insane quirks and headscratchers
* not tied to xcode or android studio. many people hate both. both are heavy ides.
* redux-like pattern is good and intuitive. state management in android used to be very unfriendly.
* documentation is existent for common items and code is generally readable for the rest
* write once for custom views
* no npm bugs
* development velocity feels fast with less obvious cruft. this is very subjective. i believe i could get similar results with ios as well - i'd just hate myself more.
* material icons are provided in code. this is a small thing but having to import icons individually in ios was the worst.
* interop to native java/swift seems fine. haven't really tried but you can read more [here](https://flutter.io/platform-channels/)
* doesn't need libraries for a better dev experience (android people know what i mean)

## FLUTTER CONS
* ui isn't native. scroll-to-refresh widget is obviously different. collapsing toolbars on android are atrocious.
* not write once if you're trying to target system look & feel. honestly not sure how you're supposed to switch between cupertino/material styles without completely rewriting the views
* feels very beta. missing many plugins people might need
* feels very beta. http is an odd story. recommended http client seems very limited but you can just use the real dart client.
* still requires an ide for development. definitely not vim/emacs friendly.
* dart?? feels like a better JavaScript but worse TypeScript. limited ecosystem except for decent google libraries.
* sometimes get odd dependency issues. seems like you can only have 1 version of any given lib a once but lib *a* might require v0 while lib *b* requires v1 resulting in a catastrophe

## conclusion
go for it. i would definitely use flutter for api consumption apps. would be questionable for business-logic heavy apps that require features beyond the immediate flutter sdk.

### build / install
for android:
1. `git clone git@github.com:choyg/hn.git`
1. plug in device
1. `cd ${project_dir}`
1. `flutter build apk`
1. `flutter install`

for ios:
1. i have no idea but you can read [this](https://flutter.io/ios-release/)

### faq

**why does this look like [materialistic](https://play.google.com/store/apps/details?id=io.github.hidroh.materialistic)?** not sure what you're talking about.

**is this free?** yes.

**is this free?** yes.
