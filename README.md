# README

<h2>Covid-19 Relief Application (CRA)</h2>

<h3>Overview<h3>

As Covid-19’s infections keeps increase, many people are confused and there is a lot of anxiety because a lot of people doesn’t know more about it or have professionals to talk to about it and that helps the spread of misinformation and creates a lot of psychological problems and that’s where CRA comes in, an application where you can get real news and where you can talk to medical professionals whether you have some symptoms and want to know if it’s not another disease or if you want to talk about your mental health during this crisis

<h3>Versions</h3>

Ruby 2.6.5, Rails 5.2.4

<h3>Functions</h3>
- Create Admin user<br>
- Create Users (Doctors)<br>
- Edit/Delete Users (Doctors)<br>
- Create Users (Patients)<br>
- User View Function<br>
- Messaging Function<br>
- Login Function<br>
- Email notification function<br>
- Pagination function<br>
- Search function<br>
- Getting News function<br>
- Self Screening function<br>
- guard-livereload<br>
- Activate doctor’s accounts function

<h3>Catalog design</h3>
https://docs.google.com/document/d/1Rd42Yjrem_pQDzaBcn42rNh0R4hHjFFI-jJzkni9_E0/edit?usp=sharing

<h3>Table definition</h3>
https://docs.google.com/document/d/1FCmVvV8ZUsMzj6fFRwoXJTM8xY4w2ncOf-01nAxou4g/edit?usp=sharing

<h3>ER diagram</h3>
https://cacoo.com/diagrams/SdWSaI2lHy7LaTru/0521A

<h3>Screen transition</h3>
https://cacoo.com/diagrams/SdWSaI2lHy7LaTru/E9117

<h3>Wire frame diagrams</h3>
https://cacoo.com/diagrams/SdWSaI2lHy7LaTru/E63CC

<h3>Scheduled to use Gem</h3>
- guard-livereload<br>
- bcrypt<br>
- carrier-wave<br>
- Devise

<h3>How to use the system</h3>

<h5>Users of the system</h5>

- Doctor
- Admin
- Patient

<h6>Doctor</h6>

**signup**
- open the main page
- click doctor on the top right of the main page
- click signup
- fill in the form(continue)
- fill in the form and upload your cv(continue)
- wait for an email that tells you that your account has been activated

**signin**<br>
after your account has been activated
- open main page
- click doctor on the top right of the main page
- fill in the form(continue)
- navigate according to the indicators

**go online**<br>
for the patients to see you, you need to be online by following the indicators in your dashboard

**go offline**<br>
for the patients to not see you when you are not working go offline by following the indicators in your dashboard

**other activities**<br>
follow the indicators in your dashboard

<h6>Admin</h6>

**Activate a doctor**
- open main page
- click doctor on the top right of the main page
- fill in the form with the right credentials(continue)
- look for requests table below
- go to the last page
- download their cv and examine it
- click activate

**other activities**
follow the indicators in your dashboard

<h6>Patient</h6>

**all activities**
follow the indicators from the main page
