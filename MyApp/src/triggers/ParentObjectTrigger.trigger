trigger ParentObjectTrigger on ParentObject__c (before insert, before update) {
    if(Trigger.isBefore){
    	if(Trigger.isUpdate){
    		List<ParentObject__c> grandParentObject = [SELECT GrandParentObject__r.Message__c, Name FROM ParentObject__c];
    		if(!grandParentObject.isEmpty()){
    		grandParentObject[0].GrandParentObject__r.Message__c =
    		'<'+system.now() + '> - <'+ grandParentObject[0].Name + '> - <' +  Trigger.New[0].Message__c + '> ';
    		update grandParentObject[0].GrandParentObject__r;
    		}
    	}
    	if(Trigger.isInsert){
    		GrandParentObject__c gpo = new GrandParentObject__c(Name='Grand'+Trigger.New[0].Name);
    		gpo.Message__c=Trigger.New[0].Message__c;
    		Trigger.New[0].GrandParentObject__r=gpo;
    		upsert gpo;
    	}
    }
}