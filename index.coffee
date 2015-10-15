
module.exports = (app) ->
	ads = null

	app.get '*', (page, model, params, next) ->
		adsQ = model.query 'ads', {}
		adsQ.subscribe (err) ->
			if adsQ
				ads = adsQ.get()

			next()

	class MyComponent
		view: __dirname
		name: 'k-ads'

		getad: ->
			m = @model.root
			l = ads?.length
			if l
				i = Math.floor(Math.random() * (l + 1))
				ad = ads[i]
				if ad
					ad.data

	app.component MyComponent
