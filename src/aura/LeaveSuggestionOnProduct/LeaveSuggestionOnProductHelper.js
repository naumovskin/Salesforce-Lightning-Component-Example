({
    open: function(component, event, helper) {
        var backdrop = component.find("backdrop");
        var modal = component.find("modal");
        $A.util.addClass(backdrop, "slds-backdrop--open");
        $A.util.addClass(modal, "slds-fade-in-open");

    },

    close: function(component, event, helper) {
        var backdrop = component.find("backdrop");
        var modal = component.find("modal");
        $A.util.removeClass(backdrop, "slds-backdrop--open");
        $A.util.removeClass(modal, "slds-fade-in-open");

    },
    checkIfProduct: function(component, event, helper) {
        var recordId = component.get("v.recordId");
        var idPrefix = recordId.substring(0, 3);
        var isProductPage = component.find("isProduct");
        // 01t stands for Product2 ID prefix.
        if (idPrefix === '01t') {
            $A.util.removeClass(isProductPage, "slds-hidden");
        }
    },

    submitProductSuggestion: function(component, event, helper) {
        var recordId = component.get("v.recordId");
        var description = component.find("description").get("v.value");
        if (!description) {
            swal({
                title: 'Error',
                text: 'Please enter description!',
                type: 'error'
            });
            return false;
        }
        var action = component.get("c.getCommunityProductFeedback");
        action.setParams({
            "recordId": recordId,
            "description": description
        });
        action.setCallback(this, function(response) {
            var state = response.getState();
            if (state === "SUCCESS") {
                var n = response.getReturnValue();
                if (n != null) {
                    diagMsg = 'Thank you for submitting your suggestion';
                    swal({
                        title: 'Success',
                        text: diagMsg,
                        type: 'success',
                        showConfirmButton: false
                    });
                    $A.get('e.force:refreshView').fire();
                } else {
                    diagMsg = 'Something went wrong! Please try again later.';
                    swal({
                        title: 'Error',
                        text: diagMsg,
                        type: 'error'
                    });
                }
            }
        });
        $A.enqueueAction(action);

    },

})