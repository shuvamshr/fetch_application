# Fetch App - Parasite Control Feature

Welcome to the Fetch App's Parasite Control feature! This project is a proof-of-concept designed to showcase a flea tracking and ordering system built using Flutter. The main focus was to create a responsive and maintainable frontend with solid data modeling and a simple, yet effective, software architecture for backend logic.

## Live Demo

Feel free to look around via the live link: https://fetch-application.web.app/

## How-To Run

- Install Flutter https://docs.flutter.dev/get-started/install
- Open any terminal and enter >> git clone https://github.com/shuvamshr/fetch_application.git

## Overview

This feature was inspired by a challenge to design a polished feature using Flutter. The goal was to develop a Parasite Control (Tick/Fleas/Mites) scheduling system where users can track and set reminders for their pet's next medication or appointment. Additionally, the system recommends specific medications or appointments based on the type of parasite control and the type of pet.

## Key Features

- **Frontend Design and Development:**
  - Responsive and maintainable Flutter widgets/components.
  - Utilized a Figma Design Kit to ensure all UI elements adhered to Fetch's branding guidelines.
  - Dart constants for design primitives were used to maintain consistency.

- **Data Modeling:**
  - Created data models for Pet, Category, Tracker, and Medication.
  - Trackers can be created by selecting a Pet and Category, with recommended medications provided based on a simple intersection algorithm.
  - Data is fetched from JSON files, with no authentication or database integration at this stage.

- **Software Architecture:**
  - Implemented the MVVM (Model-View-ViewModel) pattern.
  - Managed state within the ViewModel using the Provider package, ensuring widgets remain Stateless.
  - All logic related to tracking and recommendations is encapsulated within the TrackerViewModel.
