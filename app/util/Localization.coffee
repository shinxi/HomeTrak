Ext.define 'HomeTrak.util.Localization', ->
    context = ''
    localization = 
        singleton: true
        init: (_context) ->
            context = _context
            this.init = null
            return
        get: (path) ->
            pathes = path.split "."
            next = context
            for p in pathes
                next = next[p]
            return next
    return localization