# FestiSwap
Geofenced and timed event specific marketplace web app for posting and viewing classifieds  



Code Platoon 
Bravo Platoon Capstone Projects


Team Members: 
Scott Plunkett
Conlin McManus
Daniel Kweon-Lee
FestiSwap 
PROJECT DURATION
Apr 21- May5 2017
MISSION
Give time and space, a marketplace.
OVERVIEW

People at events sell, buy, or trade things to other people.  (ex. music festivals, garage sales, motorcycle rallies, fairs...). Most events have a specific duration and occur in a specific place. (ex. 2900 block of Washtenaw Ave, Chicago, IL from 6-8pm).  

It follows that people sell, buy, or trade things to other people at specific times in specific places.  Yet there is currently no digital platform that offers the developing shareconomy the experiential and informational benefits of an online peer-to-peer marketplace scoped and validated both geographically (by location) and temporally (by time).  While there are numerous online marketplaces that use or offer location as a filter method for users to find relevant offerings ( craigslist, LetGo, etc. ) and some that offer temporal filtering ( eBay, QuiBids, Deal Dash, etc. ), these services in actual social gatherings, are limited in relevance because they lack user & event awareness and rather than attempt to develop & increase the interpersonal experiences of users, they instead are focused on minimizing face to face interaction and virtually relegating the purchasing process. 

FestiSwap’s focus will be on event specific classifieds.  It will provide an event’s attendees virtual digital signage in the form of user generated ads, enabling artisans, craftspeople, barterers, and buyers at an event to display information (ex. product descriptions, inventory, interevent location data, pricing, etc. ) relevant to their offering, whatever that may be.  Along with the ability for a user to CRUD  (create, read, update, and/or destroy) a classified ad, we will offer assurance that viewership is specific to other users at the event to which an offering is tied.  In other words, we will ensure both the poster of a classified and the reader of a classified are actually present at the event, during the event.  Validating users will be accomplished via three methods: user geolocation, event location geofencing, and event duration timing.  Possible techniques and tools for these methods are outlined in the GOAL and TECHNOLOGY sections below.

GOAL

The goal of this project is to create a classifieds app that incorporates:

Geolocating: of users (possibly via the browser based Geolocation API, this API has a follow method that can track a user location in real-time)

Geofencing of event marketplaces (possibly via spatial objects (latitude and longitude points) as attributes or column values in a PostGIS database, possibly displayed through the Google Maps API)

Timing of event marketplace instantiation and destruction (possibly via ActiveJob)

SCOPE

MVP

Create a user CRUD classifieds app with marketplace views specified and divided by event.

Integrate geofencing and time boxing for the marketplaces.  

Track a users geolocation and use their proximity to an event as validation to enter a specific event marketplace and CRUD classifieds in that marketplace. 
