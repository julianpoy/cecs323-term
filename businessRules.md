1) Dave’s Automotive logs the prices which other auto-repair shops charge for services comparable to those provided at Dave’s. This information would allow Dave’s to come up with competitive prices for their customers. 

***Implementation: this rule might require a class for competitors in a many to many relationship with service types and an association classes for specific service types provided by specific competitors.*** 
	
2) Dave’s Automotives hires interns and apprentices. This insures that Dave’s Auto Repair Shop has an ample pool of experienced potential employees. It also gives prospective employees a chance to prove themselves and get a sense of the work environment.

***Implementation: this rule would require a separate class for interns/apprentices. By virtue of not being full time employees, this class might have different attributes such as employment duration, and evaluation notes*** 

3) Dave’s Automotives allows employees to charge certain expenses to a company credit card. This establishes a sense of trust between management and the employee. It also allows employees to take potential clients out to lunch and buy materials required for on site jobs.

***Implementation: this rule would require an expenses class which would be connected to particular employees. It might include such attributes as employee id, expense cost, expense reason, time, date, and notes*** 

4) Dave’s Automotives uses its database to track sick days and personal days. This insures that employees are mindful of the days they have taken off work.

***Implementation: this rule might require a class connected to employee with such attributes as starting leave date, duration, and reason*** 

5) Dave’s Auto Repair Shop does a periodic employee review to insure quality work.

***Implementation: this rule would require a subclass to designate certain employees as qualified to review others. This rule would also require a class which would allow experienced employees to write evaluation noted on the employees which they review.***
