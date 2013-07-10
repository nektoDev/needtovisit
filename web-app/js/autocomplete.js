function autocompleteAddPlace() {
    var currentUser = $('#userid').val();
    jQuery("#add-place-input").autocomplete({
        minLength: 0,
        source: function (request, response) {
            search(request, response);
        },
        focus: function (event, ui) {
            $("#add-place-input").val(ui.item[0].name);
            return false;
        },
        select: function (event, ui) {
            $("#add-place-input").val(ui.item[0].name);
            return false;
        }
    })
        .data("ui-autocomplete")._renderItem = function (ul, item) {

        var result = null;
        var users = "";

        item[1].forEach(function (rel) {
            if (rel.user.id == currentUser) {
                result = $("<li class='ui-state-disabled'>")
                    .append("<a><img src='images/place-default.jpg' class='img-rounded place-img-small'/> " + item[0].name + "<small class='pull-right'><i>Вы уже хотите посетить это место</i></small></a></li>");
            }
            users += " <span class='label'>" + rel.user.username + "</span>";
        });

        if (result == null) {

            result = $("<li>")
                .append("<a><img src='images/place-default.jpg' class='img-rounded place-img-small'/> " + item[0].name + "<small class='pull-right muted'><i>Хотят посетить: " + users + "</i></small></a></li>");
        }

        result.append("<li class='ui-menu-divider'></li>");
        return result.appendTo(ul);
    };
}

