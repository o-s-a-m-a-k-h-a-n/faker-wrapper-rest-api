module Project
  class App < Sinatra::Base

    configure do
      register Sinatra::Namespace
    end

    configure :development do
      Bundler.require :development
      register Sinatra::Reloader
    end

    namespace "/api/#{Faker::VERSION}" do

      get '/' do
        redirect '/'
      end

      get '/:cls/:meth' do
        if (params[:cls] && params[:meth])
          begin
            @cls = params[:cls].titlecase
            @meth = params[:meth].downcase
            @resp = eval("Faker::#{@cls}.#{@meth}")
            @result = 'success'
          rescue
            @resp = "Invalid class or method name"
            @result = 'fail'
          end
        end
        jbuilder :faker
      end

    end

    get '/' do
      @result = 'error'
      @resp = "UNDEFINED ROUTE: API available at ''/api/<faker-class-name>/<faker-class-method'. This API does not support method parameters curretly."
      jbuilder :faker
    end

    get '/api/?' do
      redirect '/'
    end

    get '/api/:cls/:meth' do
      redirect "/api/#{Faker::VERSION}/#{params[:cls]}/#{params[:meth]}"
    end

  end

end
