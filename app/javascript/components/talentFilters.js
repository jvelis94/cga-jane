import Rails from "@rails/ujs"
// Wrap our fetch() method in a function we can call whenever we want
const talentFilters = () => {

    // let filterTalents = (filters) => {
    //     const talentsList = document.getElementById('talentsList');
    //     console.log(`filters length is ${filters.length}`)
    //     let filterParams = (filters.length > 0) ? `?filter=${filters}` : ""
      
    //     let actionUrl = `talents${filterParams}`;
    
    //     fetch(actionUrl, {
    //         method: 'GET',
    //         headers: {
    //             'X-CSRF-Token':     document.getElementsByName('csrf-token')[0].getAttribute('content'),
    //             'X-Requested-With': 'XMLHttpRequest',
    //             'Content-Type':     'application/html',
    //             'Accept':           'application/html'
    //         },
    //         credentials: 'same-origin'
    //     }).then((response) => {
    //         if (response.status == 200) {
    //             response.text().then((content) => {
    //                 talentsList.innerHTML = content
    //             })
    //         }
        
    //     });
    // }




    // const infraFilter = document.getElementById('infra-btn');
    // infraFilter.onclick = () => { filterTalents('Infrastructure'); }
    var checkBoxes = document.querySelectorAll(".form-check-input");
    var form = document.querySelector('form');
  
    for (const check of checkBoxes) {
        check.addEventListener( 'change', function() {
            
            console.log('clicked on filter')
            Rails.fire(form, 'submit');
        });
    }
    
}

export {talentFilters}