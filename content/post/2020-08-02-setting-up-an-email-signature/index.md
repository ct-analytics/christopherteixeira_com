---
# Documentation: https://wowchemy.com/docs/managing-content/

title: "Setting up an email signature"
subtitle: ""
summary: "It takes some consideration to determine what you put into an email signature but there are some great services out there to help."
authors: 
- admin
tags: 
- Other
categories: 
- HTML
date: 2020-08-02T19:24:41-05:00
lastmod: 2021-01-18T19:24:41-05:00
featured: false
draft: false

# Featured image
# To use, add an image named `featured.jpg/png` to your page's folder.
# Focal points: Smart, Center, TopLeft, Top, TopRight, Left, Right, BottomLeft, Bottom, BottomRight.
image:
  caption: ""
  focal_point: ""
  preview_only: false

# Projects (optional).
#   Associate this post with one or more of your projects.
#   Simply enter your project's folder or file name without extension.
#   E.g. `projects = ["internal-project"]` references `content/project/deep-learning/index.md`.
#   Otherwise, set `projects = []`.
projects: ["website"]
---

## Background

Email signatures are a great way to personalize your own responses. Many people out there by default say something like "Best, John" or "Regards, Jane" which is very respectful, but also plain. If you're trying to make a good first impression with a company or trying to win a contract, a formatted email signature can go a long way. 

## Simple Options

Not everyone you send an email to will have the ability to render a nicely formatted email signature using HTML, either for security reasons or perhaps due to bandwidth issues. That being said, you can easily organize the content in an email signature in a way that allows someone to read it quickly. First up, determine what you want for content in your signature. These days, we can have mutliple sites or links associated with our lives from social media (e.g., Facebook, Twitter, LinkedIn), professional facing sites (e.g., GitHub, Kaggle), or other miscellaneous ones you might want to show off. I recommend being selective and choosing a set that you want someone on the other end that you want them to potentially see. 

For simplicity, let's aim at LinkedIn, GitHub, and my website. This allows us to craft a simple looking email that will render in anyone's inbox.

>Christopher Teixeira <br>
>christopherteixeira.com <br>
>LinkedIn: linkedin.com/in/christopherteixeira/ <br>
>Twitter: twitter.com/ct_analytics <br>

Simple and readible, yet you can see that with all these links a little HTML will make it even easier for another person to follow you.

## HTML Options

Before I get in, its important to take note of what email provider and software you use. Not all of them will let you set up an email signature consisting of raw HTML code. Email clients like Gmail will let you format your text (i.e., bold, underline, add an image, etc.) but its not as flexible as you might like. If you're limited by that, then you can just work with the example above to add some formatting.

However, I use Spark which gives me the full flexibility of setting up an HTML signature. It's not too hard to craft something using tables and pictures, however, there are some great sites out there that will do the hard work for you. Here's a couple sites to get started with:

- [HubSpot Email Signature Generator](https://www.hubspot.com/email-signature-generator)
- [https://si.gnatu.re/](https://si.gnatu.re/)

I ended up using [https://si.gnatu.re/](https://si.gnatu.re/) since it gave me a few more options I liked. However, it's only available to edit for 30 days. If you want to edit it on day 31, you either edit the raw HTML yourself or start from scratch. I recommend pitching in the $5 since this site is incredible. I was able to generate the following signature which I'm currently using still:

<br>

<table width="300" cellspacing="0" cellpadding="0" border="0">
  <tr>
    <td style="vertical-align:top;padding-right:10px">
      <img style="border:none;"width="100"src="https://s1g.s3.amazonaws.com/43c4c2f551be55f253472cb3def28ceb.jpeg">
    </td>
    <td style="border-left:solid #000000 2px;" width="12"></td>
    <td style="vertical-align: top;text-align:left;color:#212529;font-size:12px;font-family:tahoma;;text-align:left">
      <span>
        <b>
          <span style="margin-right:5px;color:#212529;font-size:15px;font-family:tahoma">Christopher Teixeira</span>
        </b><br>
        <span style="margin-right:5px;color:#212529;font-size:12px;font-family:tahoma">Using Data for Social Good</span>
      </span>
      <br>
      <br>
      <table cellpadding="0" cellpadding="0" border="0">
        <tr>
          <td style="padding-right:5px">
            <a href="https://twitter.com/ct_analytics" style="display: inline-block;">
              <img width="40" height="40" src="https://s1g.s3.amazonaws.com/28597d480b109b5483f87cda4245435b.png" alt="Twitter" style="border:none;">
            </a>
          </td>
          <td style="padding-right:5px">
            <a href="https://linkedin.com/in/christopherteixeira" style="display: inline-block;">
              <img width="40" height="40" src="https://s1g.s3.amazonaws.com/affc8f54dec2b8991dc1e982f054d968.png" alt="LinkedIn (Personal)" style="border:none;">
            </a>
          </td>
          <td style="padding-right:5px">
            <a href="https://github.com/ct-analytics" style="display: inline-block;">
              <img width="40" height="40" src="https://s1g.s3.amazonaws.com/cedb8206a2a61cb5489bb6976efedf14.png" alt="Github" style="border:none;">
            </a>
          </td>
        </tr>
      </table>
      <a href="https://www.christopherteixeira.com" style="text-decoration:none;color:#0088CC;">www.christopherteixeira.com</a>
    </td>
  </tr>
</table>
