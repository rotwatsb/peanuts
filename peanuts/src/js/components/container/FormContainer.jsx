import React from 'react';

const withForm = (FormComponent) => {
    return class FormContainer extends React.Component {
        constructor(props) {
            super(props);

            this.handleSubmit = this.handleSubmit.bind(this);
        }

        handleSubmit(submitEvent) {
            console.log(submitEvent);
            submitEvent.preventDefault();
            console.log('****************************************************************');
            console.log('submit!');
        }

        render() {
            return (
                <FormComponent {...this.props} handleSubmit={this.handleSubmit}/>
            );
        }
    }
}

export default withForm;
