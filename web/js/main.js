
/*View to post modeling*/
var views_counter = $('.views_counter');

if(views_counter.length > 0) {
    setInterval(function(){
        var id = views_counter.data('id');
        updateViews(id);
    }, 3000);
}

function updateViews(id) {
    $.ajax({
        url: '/post/random-views',
        data: {id: id},
        type: 'GET',
        success: function(data) {
            //console.log(data);
            $('.view_current').html(data.view_current);
            $('.view_total').html(data.view_total);
        },
        error: function(data) {
            console.log(data);
        }
    });
}

/* Comments like */
$('.comment_like').on('click', function () {
    var th = $(this),
        comment_id = th.data('comment_id');

    $.ajax({
        url: '/comment/like',
        data: {
            comment_id: comment_id
        },
        type: 'GET',
        success: function(data) {
            console.log(data);
            th.find('.total_like').html(data.total_like);
        },
        error: function(data) {
            console.log(data);
        }
    });
    return false;
});

/*Ajax search by tags*/
$("#search_input").keyup(function(){
    var th = $(this),
        input_val = th.val();
    $.ajax({
        url: '/search/ajax-hint',
        data: {title: input_val},
        type: 'GET',
        beforeSend: function () {
            removeChildren(document.querySelector('.search-results'));
        },
        success: function(data) {
            console.log(data);
            parseResults(data);
            if (input_val === '') {
                removeChildren(document.querySelector('.search-results'));
            }
        },
        error: function(data) {
            console.log(data);
        }
    });

});

function parseResults(reqest) {
    var fragment = document.createDocumentFragment(),
        ul = document.createElement('ul'),
        li, link;
    if(reqest.length > 0) {
        reqest.forEach(function(item) {
            li = document.createElement('li'),
            link = document.createElement('a');
            link.href = '/search/tag?tag_id='+item.id;
            link.target = "_blank";
            link.appendChild(document.createTextNode(item.title));
            li.appendChild(link);
            fragment.appendChild(li);
        });
        ul.appendChild(fragment);
        document.querySelector('.search-results').appendChild(ul);
    } else {
        // document.querySelector('.search-results').appendChild(ul);
        // ul.appendChild(li);
        // li.appendChild(document.createTextNode('Nothing was found :-('));
    }
}

function removeChildren(elem) {
    while (elem.lastChild) {
        elem.removeChild(elem.lastChild);
    }
}

