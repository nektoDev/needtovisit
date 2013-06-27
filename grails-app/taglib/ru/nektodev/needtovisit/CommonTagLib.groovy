package ru.nektodev.needtovisit

class CommonTagLib {

    /**
     *
     */
    def formInput = { attrs, body ->

        out << "<div class=\"control-group fieldcontain " + hasErrors(bean: attrs.bean, field: attrs.field, 'error') + " ${attrs.required == true ? "required \"" : "\" "}>"

        out << "<label for=${attrs.field} class=\"control-label\">" +
               message(code: attrs.label, default: attrs.defaultLabel)

        if (attrs.required == true) {
            out << "<span class=\"required-indicator\">*</span>\n"
        }
        out << "</label>"

        out << "<div class=\"controls\">\n"

        out << body()

        out << "</div>"

        out << "</div>"
    }
}
