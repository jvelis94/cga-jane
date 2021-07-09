
// Wrap our fetch() method in a function we can call whenever we want
const talentFilters = () => {

    let filterTalents = (filters) => {
        const talentsList = document.getElementById('talentsList');
        console.log(`filters length is ${filters.length}`)
        let filterParams = (filters.length > 0) ? `?filter=${filters}` : ""
      
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




    // const infraFilter = document.getElementById('infra-btn');
    // infraFilter.onclick = () => { filterTalents('Infrastructure'); }
    let selectedFilters = []
    let filterClicks = {}
    let filters = document.querySelectorAll(".checkboxes")

    filters.forEach((filter, index) => {
        filterClicks[index] = 0
        let input = filter.querySelector('#flexCheckDefault')
        let label = filter.querySelector('.form-check-label')

        input.onclick = () => { 
            filterClicks[index] += 1

            if (filterClicks[index] % 2 === 0) {
                let index = selectedFilters.indexOf(label.innerText)
                selectedFilters.splice(index,1)
            }
            else {
                selectedFilters.push(label.innerText);
            }
            if (selectedFilters.length > 0) {
                filterTalents(selectedFilters)
            }
            else {
                location.reload();
            }
        }

        // console.log(input, label.innerText)
        
    })
    
}

export {talentFilters}