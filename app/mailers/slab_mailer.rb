class SlabMailer < ApplicationMailer
    def project_created
        p "Starting project_created"
        @project = params[:project]
        p params
        user = "jpcortesm@slabcode.com"
        delivery_options = { 
            port: 587,
            user_name: "juanslabtestmail@gmail.com",
            from: "juanslabtestmail@gmail.com",
            password: "Pa$$word1234",
            address: "smtp.gmail.com",
            authentication: "plain",
            enable_starttls_auto: true }
        p "mail sending"

        mail(to: user, subject: "Project Created")
        rescue StandardError, AnotherError => e
            puts "Rescued: #{e.inspect}"
    end
end
