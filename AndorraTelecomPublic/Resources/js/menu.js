var divCallMeBack;

function buildMenu() {
    var newBody = document.createElement('body');
    var bannerTop = document.getElementsByClassName('big-banner cont-wrapper')[0];
    var icons = document.getElementsByClassName('item picture');
    var titles = document.getElementsByClassName('item title');

    removeItemByClassName(bannerTop, 'flex-control-nav flex-control-paging', 0);
    removeItemByClassName(bannerTop, 'flex-direction-nav', 0);
    removeItemsByClassName(bannerTop, 'block-container');

    var buttonList = createButtons(icons, titles);
    divCallMeBack = document.getElementsByClassName('call-me-back')[0];

    document.body = newBody;
    document.body.appendChild(buttonList);
    document.body.insertBefore(bannerTop, buttonList);
    
}

function removeItemByClassName(node, className, position) {
    var item = node.getElementsByClassName(className)[position];
    item.remove();
}

function removeItemsByClassName(node, className){
    var items = node.getElementsByClassName(className);
    for (var i = items.length - 1; i >= 0; i--) {
        items[i].remove();        
    }
}

function createButtons(icons, titles) {

    var buttonList = document.createElement('ul');

    for (var i = 0; i < icons.length; i++) {
        var button = createButton(icons[i], titles[i]);
        addClick(i, button)
        buttonList.appendChild(button);
    }

    return buttonList;
}

function createButton(icon, title) {
    var button = document.createElement('li');
    button.className = 'item-button';

    var cloneIcon = icon.cloneNode(true);
    var cloneTitle = title.cloneNode(true);
    button.appendChild(cloneIcon);
    button.appendChild(cloneTitle);

    return button;
}

function addClick(position, button) {
    button.addEventListener('click', function(event) {
        window.Screens.postMessage('click-button', '' + position);
    });
}

function createBarTop(){
    var barTop = document.createElement('div');
    var logo = document.createElement('img');

    barTop.id = 'top-bar-logo';
    logo.src = 'https://www.andorratelecom.ad/o/atcomercial-theme/images/logo-atelecom.png';
    barTop.appendChild(logo);

    return barTop;
}

function getTextCallMeBack() {
    var headerCallMeBack = divCallMeBack.getElementsByTagName('h2')[0];
    window.Screens.postMessage('call-me-back', headerCallMeBack.innerText);
}

function readyDom(){
    window.Screens.postMessage('ready-dom', 'less');
}

buildMenu();
getTextCallMeBack();