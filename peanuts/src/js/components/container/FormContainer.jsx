import React from 'react';
import serialize from 'form-serialize'

const withForm = (FormComponent) => {
    return class FormContainer extends React.Component {

        /**
         * @param {object} props
         * @param {string} prop.formId
         */
        constructor(props) {
            super(props);

            this.handleSubmit = this.handleSubmit.bind(this);
        }

        handleSubmit(submitEvent) {
            submitEvent.preventDefault();

            const form = document.querySelector(`#${this.props.formId}`);

            const url = form.getAttribute('action');

            const fetchData = {
                method: form.getAttribute('method'),
                headers: {
                    'Content-Type': 'application/json',
                }
            };

            if (fetchData.method === 'POST') {
                fetchData.body = JSON.stringify(serialize(form, { hash: true }));
            }

            console.log(fetchData);

            const request = new Request(url, fetchData);

            fetch(request).then(console.log).catch(console.log);
        }

        render() {
            return (
                <FormComponent {...this.props} handleSubmit={this.handleSubmit}/>
            );
        }
    }
}

export default withForm;
