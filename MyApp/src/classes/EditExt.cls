public with sharing class EditExt {
    public  Account acc{get;set;}
    public Boolean shouldBeRender{get;set;}
    public EditExt(ApexPages.StandardController stdController){
    	acc = (Account)stdController.getRecord();
    }
    public PageReference redirectToEditPage(){
    	PageReference pageRef =  new PageReference('/apex/Edit?id='+ApexPages.currentPage().getParameters().get('id'));
    	//pageRef.setRedirect(true);
    	return pageRef;
    }
    public PageReference redirectToCancel(){
    	PageReference pageRef =  new PageReference('/apex/Account?id='+ApexPages.currentPage().getParameters().get('id'));
    	//pageRef.setRedirect(true);
    	return pageRef;
    }
    public PageReference redirectToSave(){
    	upsert acc;
    	PageReference pageRef =  new PageReference('/apex/Account?id='+ApexPages.currentPage().getParameters().get('id'));
    	//pageRef.setRedirect(true);
    	return pageRef;
    }
}