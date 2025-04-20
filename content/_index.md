---
# Leave the homepage title empty to use the site title
title: ""
date: 2025-03-29
type: landing

design:
  # Default section spacing
  spacing: "3rem"

sections:
  # - block: resume-biography-3
  #   content:
  #     username: admin
  #     text: ""
  #     button:
  #       text: Schedule a talk
  #       url: uploads/resume.pdf
  - block: resume-biography
    content:
      username: admin
      text: ""
      # design:
      #   banner:
      #     # Upload a cover image to `assets/media/` folder and reference its filename here (optional)
      #     filename: banner.png

      # button:
      #   text: Schedule a talk
      #   # icon: custom/person-chalkboard-solid.svg
      #   icon: brands/linkedin
      #   url: https://calendar.app.google/GjvengVJdwvRCsXL6
  # - block: cta-card
  #   content:
  #       title: test
  #       text: this is some text
  #       button: 
  #         text: test
  #       design:
  #         background:
  #           # Choose colors such as from https://html-color-codes.info
  #           gradient_start: '#4bb4e3'
  #           gradient_end: '#2b94c3'
  #           # The gradient angle from 0-360 degrees
  #           gradient_angle: 180
  #           # Text color (true=light, false=dark, or remove for the dynamic theme color).
  #           text_color_light: true
  # - block: features
  #   content: 
  #     title: test features
  #     text: this is some text
  #     items:
  #       - name: this is a name
  #         description: this is a description
  #         icon: custom/person-chalkboard-solid
  #       # - name: this is a name
  #       #   description: this is a description
  #       #   icon: custom/person-chalkboard-solid
  #       # - name: this is a name
  #       #   description: this is a description
  #       #   icon: custom/person-chalkboard-solid
  - block: cta-button-list
    content:
      buttons:
        - text: Schedule a lecture
          icon: custom/person-chalkboard-solid
          url: https://calendar.app.google/GjvengVJdwvRCsXL6
        # - title: Watch my new YouTube video to achieve 20x productivity
        #   icon: custom/baseball-solid
        #   url: https://youtube.com
        # - title: Connect with me on LinkedIn
        #   icon: brands/linkedin
        #   url: https://linkedin.com
  - block: resume-skills
    id: skills
    content: 
      title: Skills & Hobbies
      username: admin
    design:
      show_skill_percentage: true
  - block: resume-experience
    id: experience
    content:
      username: admin
    design: 
      date_format: 'January 2006'
      is_education_first: true
  - block: collection
    id: posts
    content:
      title: Recent Posts
      subtitle: ''
      text: ''
      page_type: post
      count: 3
      filters:
        folders:
          - post
        author: ''
        category: ''
        tag: ''
        publication_type: ''
        featured_only: false
      offset: 0
      sort_by: 'Date'
      sort_ascending: false
    design:
      # Choose a layout view
      view: date-title-summary
      # view: article-grid
      # Reduce spacing
      spacing:
        padding: [0, 0, 0, 0]
  - block: collection
    id: projects
    content:
      title: Projects
      subtitle: ''
      text: 'This list of projects represents the details of my experience across my career and how I supported customers’ decision making on complex challenges.'
      count: 6
      filters:
        folders:
          - project
        author: ''
        category: ''
        tag: ''
        publication_type: ''
        featured_only: false
      offset: 0
      sort_by: 'Date'
      sort_ascending: false
    design:
      view: article-grid
      columns: 3
  - block: collection
    id: talks
    content:
      title: Recent & Upcoming Talks
      filters:
        folders:
          - event
    design:
      view: date-title-summary
      columns: 1
  # - block: stats
  #   id: stats
  #   content:
  #     title: test stats
  #     text: this is a section on stats
  #     items:
  #       - statistic: test stat 1
  #         description: test description for stat 1
  #       - statistic: test stat 2
  #         description: test description for stat 2
  #       - statistic: test stat 3
  #         description: test description for stat 3
---