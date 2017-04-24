alwaysWithin2000Miles and accidentFreeAtDaves are denormalized values from instanceOfCar. These help us with quick queries concerning the status of their customer eligibility.

lastIntervalPerformed is somewhat denormalized. Instead of tracking each interval completed, we’ve opted to store the raw date in instanceOfCar and update it when the vehicle is brought in for service. Additionally, updatedDate will have to be updated every time a small item is done for the vehicle, but will make it easier to find out the last service date for a vehicle.

dateLastPaymentReceived in Permier is a replacement for tracking actual payments for Premier service. To make it easier for this implementation, we’ve chosen not to track payments for this service.

dateOilChangeReceived in steadyReferral makes it simpler to track whether a given free oil change credit is consumed. Although it may be good to have a reference here, this date value gives us an easy way to query unused free oil changes.
