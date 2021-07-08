const copyToClipboard = () => {
    const copyMobile = document.querySelectorAll("#copy-mobile")
    const copyText = document.querySelectorAll("#copy-text")
    
    function copy() {
        
        console.log(copyText[7])
        // copyText[7].select()
        let textContent = copyText[11].textContent
        navigator.clipboard.writeText(textContent)

        // document.execCommand("copy")
    }

    copyMobile[7].addEventListener("click", copy)
}

export { copyToClipboard }