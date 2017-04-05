trigger ChildObjectTrigger on ChildObject__c (before insert, before update) {
    if(Trigger.isBefore){
    	if(Trigger.isUpdate){
    		List<ChildObject__c> parentObject = [SELECT ParentObject__r.Message__c, Name FROM ChildObject__c];
    		if(!parentObject.isEmpty()){
    		parentObject[0].ParentObject__r.Message__c =
    		'<'+system.now() + '> - <'+ parentObject[0].Name + '> - <' +  Trigger.New[0].Message__c + '> ';
    		update parentObject[0].ParentObject__r;
    		}
    	}
    	if(Trigger.isInsert){
    		ParentObject__c po = new ParentObject__c(Name='Parent'+Trigger.New[0].Name);
    		po.Message__c=Trigger.New[0].Message__c;
    		Trigger.New[0].ParentObject__r=po;
    		upsert po;
    	}
    }
}