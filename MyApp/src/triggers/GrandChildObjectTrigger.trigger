trigger GrandChildObjectTrigger on GrandChildObject__c (before update) {
    
    if(Trigger.isBefore){
    	if(Trigger.isUpdate){
    		List<GrandChildObject__c> childObject = [SELECT ChildObject__r.Message__c, Name FROM GrandChildObject__c];
    		if(!childObject.isEmpty()){
    		childObject[0].ChildObject__r.Message__c =
    		'<'+system.now() + '> - <'+ childObject[0].Name + '> - <' +  Trigger.New[0].Message__c + '> ';
    		update childObject[0].ChildObject__r;
    		}
    	}
    	if(Trigger.isInsert){
    		ChildObject__c co = new ChildObject__c(Name='Child'+Trigger.New[0].Name);
    		co.Message__c=Trigger.New[0].Message__c;
    		Trigger.New[0].ChildObject__r=co;
    		upsert co;
    	}
    }
}