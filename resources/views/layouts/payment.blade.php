<!DOCTYPE html translate="no">
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}" translate="no">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="google" content="notranslate">
    <!-- CSRF Token -->
    <meta name="csrf-token" content="{{ csrf_token() }}">
    <meta name="keywords" content="car hire, cheap car hire, car rental,  rent a car, car rentals, hire car, cheap car rentals, cheap car rental, carrentals, rent car, car hire comparison, carrental, carhire, compare car hire, car rental comparison, rentalcars, rental cars, rent a car Algarve faro">
    <meta http-equiv="description" name="description" content="Faro Car Hire in Algarve, do need to hire a car at Faro Airport in Portugal. Ask a quote and get huge on-line discounts for Algarve car hire!">
    <meta name="copyright" content="AV Rent Car, Faro Airport Car Hire">

    <title>{{ config('app.name') }}</title>
    <link rel="icon" href="{{ url('/images/websiteMains/icon.png') }}">

    <!-- Scripts -->
    <script src="https://code.jquery.com/jquery-3.4.1.min.js" integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo=" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
    <!-- Fonts -->
    <script src="https://kit.fontawesome.com/c19b8db1d3.js" crossorigin="anonymous"></script>

    <script src="https://js.stripe.com/v3/"></script>
        
    <link rel="dns-prefetch" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css?family=Nunito" rel="stylesheet" type="text/css">

    <script src="https://kit.fontawesome.com/c19b8db1d3.js" crossorigin="anonymous"></script>
    <!-- Styles -->
    <link href="{{ asset('css/app.css') }}" rel="stylesheet">
    <link rel="stylesheet" href="{{ asset('css/estilo.css') }}">

    <!-- Scripts -->
    <script src="{{ asset('js/app.js') }}" defer></script>
    <script src="{{ asset('js/validation.js') }}" defer></script>
    <script src="{{ asset('js/dateValidation.js') }}" defer></script>
    <script src="{{ asset('js/spinner.js') }}" defer></script>
  
</head>
<body >
    <div id="app">
        <!-- Modal 01 -->
        <div class="modal fade" id="ModalBoxBasic" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Terms and Conditions</h5>                
                    </div>
                    <div class="modal-body m-1">
                        <h5><b>General</b></h5>
                        <p>- We only deliver cars in the Algarve and Lisbon.</br>
                        - Besides the international airports of Faro and Lisbon we can deliver cars at your hotel or resort upon request.</br>
                        - "Rent it here, leave it there" is free of charge throughout the Algarve.</br>
                        - Minimum rental period is 3 days.</br>
                        - Minimum drivers age is 23.</br>
                        - Drivers license must be valid in Portugal and held for more than 2 years. Please ensure to have all necessary documents available for proof.</p>
                        <h5><b>Deposit</b></h5>
                        <p>- The car hire company requires the valid credit card details for security reasons. If not possessing a valid credit card, a cash security deposit has to be left which is fully returnable, when car is returned damage and loss free - Cheques cannot be accepted.</br>
                        - PLEASE NOTICE THAT WITHOUT VALID CREDIT CARD OR CASH DEPOSIT NO RENTAL CAR CAN BE DELIVERED</p>
                        <h5><b>Reservation</b></h5>
                        <p>- To make a reservation we must have full details of your flight number, flight time and departure airport.</br>
                        - When completing the reservation form, please check your email address once again as without it, we cannot reply to you.</br>
                        - Reservations must be done not less than 24 hours in advance of your arrival in Portugal to guarantee a confirmation of your booking.</br>
                        - At the airport a friendly staff member of the company will await you at the arrival gate bearing a signal with your name on it. Please look for this signal.</br>
                        - Baby/Child seat(s) are available but are charged for at the current season rate. Please mention this within the reservation form to guarantee availability.</p>
                        <h5><b>Price Information</b></h5>
                        <p>- One rental day is equal 24 hours - Each fraction of a day is considered as an additional day - Tolerance 2 hours.</br>
                        - Prices quoted on this web page are our best rates and further discount cannot be granted.</br>
                        - Rates for 3 days are 50 % of the weekly rates.</br>
                        - Rates more than 3 and less than 7 days are based on the 6 day pro-rata.</br>
                        - Rates more than 7 days are based on the 7 day pro-rata.</br>
                        - Full payment is required upon signing the rental agreement. The payment has to be done with a valid credit card (Visa/Master/Eurocard, Diners Club or American Express), travellers cheques or in cash (also foreign currencies) - foreign cheques cannot be accepted.</br>
                        - All quoted rates include free mileage, unlimited public liability and V.A.T.</p>
                        <h5><b>Insurance</b></h5>
                        <p>- In addition to compulsory third party insurance, collision damage waiver (CDW) and theft cover are provided.</br>
                        - Personal accident insurance is not included. Insurance cover is subject to an excess and daily insurance fee</br>
                        - Groups A / B / C / C1 :</br>
                        - Groups D / F/ F1 / J / J1 :</br>
                        - Groups H / H1 / I / L / L1 :</p>
                        <p>CDW (collision damage waiver) - EXCESS AND DAILY INSURANCE FEES vary from group A through to Group L1 but this information is only available upon request via email or on pickup of the vehicle.</p>
                        <p>
                        Please Note: These terms & conditions may change at any time without prior notice.</br>
                        Please read them before reservation.
                        </p>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                    </div>
                </div><!-- modal-content -->
            </div> <!-- modal-dialog -->
        </div> <!-- end Modal -->
                <!-- Modal 02 -->
        <div class="modal fade" id="ModalBox" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Terms and Conditions</h5>                
                    </div>
                    <div class="modal-body m-1">
                        <h5><b>Legal Information on Data Protection</b></h5>
                        <p>At Auto Rent V Lda we understand that the use of your personal data requires your trust. We are subject to the highest privacy standards and will only use your personal data for clearly identified purposes and in accordance with your data protection rights.</br>
                        The confidentiality and integrity of your personal data is one of our main concerns.</br>
                        This Privacy Policy establishes how Auto Rent V Lda uses the personal data of its customers and potential customers within the scope of this homepage and is composed of the following sections:</br>
                        <h5><b>Who is responsible for the processing of your personal data</b></h5>
                        <p>Av Rent a car Lda is responsible for the processing of the personal data of its customers and / or potential clients that fill out their data and the submission of the Consent Form for Marketing Communications of Av Rent a car Lda through this homepage.</br>
                        How we collect your personal data Your personal data will be collected and processed in the following situations:</br>
                        1. If you complete your personal data and submit the Consent Form on this Home Page; and / or</br>
                        2. If you purchase and / or use a product or service provided by Auto Rent V
                        </p>

                        <h5><b>For what purposes and on what grounds can your personal data be used</b></h5>
                        <p>Your personal data will be collected and used for Customer Service and Marketing purposes (communication of information, products and services of Auto Rent V Lda), in strict terms that you select in the Consent Form on this homepage.</br>
                        According to the data protection legislation in force in the European Union (the General Data Protection Regulation), the use of personal data must be justified by at least one legal basis for the processing of personal data. You can consult the explanation of the scope of each of these grounds.</br>
                        The legal basis applicable to the collection and use of your personal data for customer service and marketing purposes is your consent.</br>
                        * Legal basis for the processing of personal data:</br>
                        . When you have given consent to the processing of your personal data (for this purpose you will be presented with a consent form for the use of your data, which consent may subsequently be withdrawn);</br>
                        . When processing is necessary to conclude a contract with or execute it;</br>
                        . When the treatment is necessary to fulfill the legal obligations to which it is subject;</br>
                        . When processing is necessary to achieve a legitimate interest and our reasons for using it prevail over your data protection rights;</br>
                        . When processing is necessary for us to testify, exercise or defend a right in legal proceedings against you, us or a third party. What Personal Data May Be Collected The following categories of personal data may be collected through the channels and services described in this Privacy Policy:</br>
                        . Data collected by Av Rent a car Lda:</br>
                        . Contact information</br>
                        . Name; address; email; telephone; company or organization name</br>
                        . Personal Information</br>
                        . Preferred Contact Channel</br>
                        . Identification data</br>
                        . Customer number; contract number</br>
                        . Customer history</br>
                        . Customer satisfaction ratio; offers received; equipment purchased, including model information, configuration, date of purchase, date of delivery, price, warranty information, purchase details, data collected during meetings, campaign / response history, customer data on equipment and / or services participation in events, complaints history, technical reports, covenants and contracts.</br>
                        . Application data, website and social networks</br>
                        . If the customer registered or authenticated, the following data may be used: average application usage (behavior within applications); location information; use of online entertainment; use of the portal of Auto Rent V Lda; use of the social networks of Auto Rent V Lda (for example, visits and publications in the forums).</br>
                        . Data in the Portal (site)</br>
                        . If you have registered on our website, you may use the following data: details of how you used the portal, the date and time and nature of your requests, your IP address, data about the device you use to interact with the portal.</p>
                        <h5><b>How do we keep your personal data safe</b></h5>
                        <p>We use a variety of security measures, including encryption and authentication tools, to help protect and maintain the security, integrity, and availability of your personal information.</br>
                        Although data transmission via the internet or website can not guarantee complete security against intrusions, we and our service providers and business partners make every effort to implement and maintain physical, electronic, and procedural safeguards to protect your personal data in accordance with the applicable data protection requirements. Among others, we have implemented the following:</br>
                        . Restricted personal access to your personal data based on the "need to know" criterion and only within the scope of the purposes communicated;</br>
                        . Transfer of data collected only in encrypted form;</br>
                        . Storage of highly confidential data (such as credit card information) only in encrypted form;</br>
                        . Protection of IT systems through firewalls, in order to prevent unauthorized access to your personal data; </br>
                        . Continuous monitoring of access to information technology systems with a view to preventing, detecting and preventing the misuse of your personal data</p>
                        <h5><b>How long we keep your personal information</b></h5>
                        <p>We store your data only for as long as is necessary for the purpose for which it was collected.</br>
                        Once the maximum period of conservation has been reached, your personal data will be irrevocably anonymised (anonymised data may be retained) or destroyed in a secure manner.</br>
                        For the purposes described in this Privacy Policy (customer service and marketing) your personal data will be kept for a maximum period of 5 years from the collection of your consent or the last contact made (whichever occurs last ) and if, within this period, you have not withdrawn your consent.</p>
                        <h5><b>How you can change or withdraw your consent</b></h5>
                        <p>You may at any time change or withdraw your consent, with effect for the future.</br>
                        Upon complete withdrawal of your consent statements you will no longer be contacted and receive communications for the purposes described in this Privacy Policy.</br>
                        If you have any questions regarding our use of your personal data, you should first contact us. In addition, you may contact the Data Protection Officer.</br>
                        Subject to certain conditions, you may have the right to request us to:</br>
                        . provide you with additional information about how we use your personal information;</br>
                        . we provide you with a copy of the personal information you have provided to us;</br>
                        . we provide you with the personal information you have provided to another party responsible for the treatment at your request;</br>
                        . update any inaccuracies in the personal data we hold;</br>
                        . erase personal data whose use is no longer legitimate;</br>
                        . limit how we use your personal information until the complaint is investigated. Their exercise of these rights is subject to certain exceptions intended to safeguard the public interest (prevention or detection of crimes) or our interest (maintaining professional secrecy). Data Retention Terms Personal data shall be preserved only for the period necessary for the purposes for which it was collected or further processed, and compliance with all applicable legal rules on archiving 
                        </p>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                    </div>
                </div><!-- modal-content -->
            </div> <!-- modal-dialog -->
        </div> <!-- end Modal -->
        <header>
            @include('includes.nav')
        </header>
        <section aria-label="breadcrumb" style="margin-top:120px;">
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="/">Home</a></li>
                <li class="breadcrumb-item active" aria-current="page">Payment</li>
            </ol>
        </section>

        @include('partials.errors') 
        @include('partials.success')
        
        <main class="py-4" >
            @yield('content')
        </main>

        @include('includes.footer')
    </div>
    
</body>
</html>
