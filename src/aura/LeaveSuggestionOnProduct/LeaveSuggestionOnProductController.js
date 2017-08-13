({
	doInit: function (component, event, helper) {

	},
    openModal: function (component, event, helper) {
        helper.open(component, event, helper);

    },
    closeModal: function (component, event, helper) {
        helper.close(component, event, helper);

    },
    submitSuggestion: function (component, event, helper) {
        helper.submitProductSuggestion(component, event, helper);
    }
})