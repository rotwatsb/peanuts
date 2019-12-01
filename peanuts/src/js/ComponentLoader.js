import ReactDOM from 'react-dom';
import React from 'react';

import NewUserForm from './components/container/forms/NewUserForm.jsx';

const componentMap = {
    'NewUserForm' : NewUserForm
};

class ComponentLoader {
    static inject(componentName, props, containerId) {
        const container = document.getElementById(containerId);

        if (container) {
            const component = React.createElement(componentMap[componentName], props, null);
            console.log('$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$');
            ReactDOM.render(component, container);
        }
    }
};

export default ComponentLoader;
