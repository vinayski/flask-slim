from flask import Flask

def create_app():
    app = Flask(__name__, instance_relative_config=True)

    @app.route('/ping')
    def ping():
        return "ok"
        
    return app

def main():
    app = create_app()
    app.run(host='0.0.0.0', port="80", debug=False)

if __name__ == "__main__":
    main()
