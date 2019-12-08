import React from 'react';
import withForm from '../FormContainer.jsx';

class _NewUserForm extends React.Component {
    constructor(props) {
        super(props);
    }

    render() {
        return (
            <form id={this.props.formId} method='POST' action='/user' onSubmit={this.props.handleSubmit}>
                <div className="form-group">
                    <label htmlFor="new-user-name">Name</label>
                    <input
                        type="text"
                        id="new-user-name"
                        name="new-user-name"
                        required
                    />
                </div>
                <button type="submit">
                    Submit
                </button>
            </form>
        );
    }
};

const NewUserForm = withForm(_NewUserForm);

export default NewUserForm;
