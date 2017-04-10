## Class Descriptions

### Vehicle
- Each time a *vehicle* is brought in for service, update milage and estimated mileage.
- Each make/model has pre defined maintance intervals w/ set of services.
    -When interval is met, email is sent to remind customer. *Customer* will list avaliability. Dave's will send appointment back.

### Service Technician
- Each item *customer* visits, *service tech* writes up maintenance visit order. They capture items for visit and assign *mechanic* for each item in the visit.
    -Mileage is logged each visit.

### Mechanic
- Track what skills each *mechanic* has. Each *maintance item* requires one or more skills.
- Its possible for a *mechanic* to be assigned to a *maintence item* that they don' t have the skills for.
- Each *mechanic* with a given skills may mentor another *mechanic*. The recieving *mechanic* may/may not have that skill.
- When mentoring relatioship starts or ends, formal record marks beginning of relationship. No limits on repeated mentorship.
- Each Employee has sick/personal days per month. We add and deduct from this pool as needed.

### Maintenance items
- A *maintenance item* could be something like changingg wiper blades, replacing struts, or changing motor mounts. 
- Each *maintenance item* has a price and average time associated with them.

### Maintenance Package
- Collection of *maintenance items*. Will NOT include other packages, only individual items.
- Identifier(PK) for package is mileage, make, and model.
- Service visits can be combination of packages in addition to individual *maintenance items*.
- Each item will have a mechanic assigned to it.
- Vehicles have unique maintenance packages. They don't share it with other vehicles, even if owned by the same person. 

### Foreign Prices
- Track other repair shop prices for comparable *maintenance items*.
- May require a many to many relationship with *Maintenance Item* and *Foreign Store*

### Foreign Store
- This tracks the nearby auto shops.

### Interns
- Dave's Auto Repair Shop hires *interns* that are mentored by a *Mechanic.* They function similarly as *Mechanic* in terms of data tracked
- For simplicity, each *Maintenance Item* can only be worked on by one *Mechanic* or *Intern* at a time. It is implicitly assumed that the mentoring
- *Mechanic* is nearby to offer advice and instruction, however we won't be keeping track of that.

### Expenses
- Each employee has an expense card that they can use. These are used to make work related purchases on site or take potential clients out to lunch.
- Each *expense* is tracked and noted. Information you'd want to keep track of is cost, reason, date, notes.

### Employee Review
- Each 3 months, employees are undergo a review where their standing is changed to a preset value. Eg. Consider Raise, Great, Needs Work, Critically Poor, etc
