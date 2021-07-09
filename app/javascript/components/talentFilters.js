
// Wrap our fetch() method in a function we can call whenever we want
const talentFilters = () => {
    let filterTalents = (filter) => {
        const talentsList = document.getElementById('talentsList');
        let filterParams = `?filter=${filter}`
      
        let actionUrl = `talents${filterParams}`;
    
        fetch(actionUrl, {
            method: 'GET',
            headers: {
                'X-CSRF-Token':     document.getElementsByName('csrf-token')[0].getAttribute('content'),
                'X-Requested-With': 'XMLHttpRequest',
                'Content-Type':     'application/html',
                'Accept':           'application/html'
            },
            credentials: 'same-origin'
        }).then((response) => {
            if (response.status == 200) {
                response.text().then((content) => {
                    talentsList.innerHTML = content
                })
            }
        
        });
    }



    const infraFilter = document.getElementById('infra-btn');
    // const javascriptFilter = document.getElementById('javascript-filter');
    // const remoteFilter = document.getElementById('remote-filter');
    
    // // Trigger filerTalents when users click on a filter button
    infraFilter.onclick = () => { filterTalents('Infrastructure'); }
    // javascriptFilter.onclick = () => { filerTalents('javascript'); }
    // remoteFilter.onclick = () => { filerTalents('remote'); }
}

export {talentFilters}