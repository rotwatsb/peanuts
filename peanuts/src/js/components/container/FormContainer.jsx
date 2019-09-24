import React, { Component } from 'react';
import ReactDOM from 'react-dom';
import Input from '../presentational/Input.jsx';

class FormContainer extends Component {
    constructor() {
        super();

        this.state = {
            title: ''
        };

        this.handleChange = this.handleChange.bind(this);
    }

    handleChange(event) {
        this.setState({ [event.target.id]: event.target.value });
    }

    render() {
        const { title } = this.state;

        return (
            <form id='article-form'>
                <Input
                    text='title'
                    label='title'
                    type='text'
                    id='title'
                    value={title}
                    handleChange={this.handleChange}
                />
            </form>
        );
    }
}

export default FormContainer;

const container = document.getElementById('create-form');
container ? ReactDOM.render(<FormContainer />, container) : false;
