<div class="box-body">
    <div class="table-responsive">
        <table class="table">
            <thead>
                <tr>
                    <th class="col-sm-2">&nbsp;</th>
                   
                    <th class="col-sm-2 text-right">{{ trans_choice('general.totals', 1) }}</th>
                </tr>
            </thead>
        </table>
        <table class="table table-hover" style="margin-top: 40px">
            <thead>
                <tr>
                    <th class="col-sm-2" colspan="12">Assets</th>
                </tr>
            </thead>
            <tbody>
            @php
                $total_paid_invoice = 0;
                $total_unpaid_invoice = 0;
                $total_revenues = 0;
                
            @endphp
               
                @foreach($tb_invoices as $invoice)
                    @if($invoice->invoice_status_code === 'paid')
                        @php $total_paid_invoice += $invoice->amount; @endphp
                    @else
                        @php $total_unpaid_invoice += $invoice->amount; @endphp
                    @endif
                @endforeach
                @foreach($tb_revenues as $revenues)
                    @php $total_revenues += $revenues->amount; @endphp
                @endforeach
                
                @php $total_assets = $total_paid_invoice + $total_revenues + $total_unpaid_invoice; @endphp
                <tr>
                    <td class="col-sm-2" colspan="12" style="padding-left:30px;"><b>Invoices</b></td>
                </tr>
                <tr>
                    <td class="col-sm-2" colspan="6" style="padding-left:60px;">Total Paid Invoices</td>
                    <td class="col-sm-2 text-right">@money($total_paid_invoice, setting('general.default_currency'), true)</td>
                </tr>
                <tr>
                    <td class="col-sm-2" colspan="6" style="padding-left:60px;">Total Unpaid Invoices</td>
                    <td class="col-sm-2 text-right">@money($total_unpaid_invoice, setting('general.default_currency'), true)</td>
                </tr>
                <tr>
                    <td class="col-sm-2" colspan="12" style="padding-left:30px;"><b>Revenues</b></td>
                </tr>
                <tr>
                    <td class="col-sm-2" colspan="6" style="padding-left:60px;">Total Revenues</td>
                    <td class="col-sm-2 text-right">@money($total_revenues, setting('general.default_currency'), true)</td>
                </tr>
            </tbody>
            <tfoot>
                <tr>
                    <th class="col-sm-2" colspan="6" >Total Assets</th>
                    <th class="col-sm-2 text-right">@money($total_assets,setting('general.default_currency'),true)</th>
                </tr>
            </tfoot>
        </table>

        @php
            $paid_bills = 0;
            $unpaid_bills = 0;
            $total_payments = 0;
        @endphp

         @foreach($tb_bills as $bills)
                    @if($bills->bill_status_code === 'paid')
                        @php $paid_bills += $bills->amount; @endphp
                    @else
                        @php $unpaid_bills += $bills->amount; @endphp
                    @endif
        @endforeach
        @foreach($tb_payments as $payments)
            @php $total_payments += $payments->amount; @endphp
        @endforeach

        @php
            $total_bills = $paid_bills + $unpaid_bills;
            $total_liability = $total_bills + $total_payments; 
        @endphp

        <table class="table table-hover" style="margin-top: 40px">
            <thead>
                <tr>
                    <th class="col-sm-2" colspan="12">Liability</th>
                </tr>
                
            </thead>
            <tbody>
                <tr>
                    <th class="col-sm-2" colspan="12" style="padding-left:30px;">Bills</th>
                </tr>
                <tr>
                    <td class="col-sm-2" colspan="6" style="padding-left:60px;">Paid Bills</td>
                    <td class="col-sm-2 text-right">@money($paid_bills, setting('general.default_currency'), true)</td>
                </tr>
                <tr>
                    <td class="col-sm-2" colspan="6" style="padding-left:60px;">Unpaid Bills</td>
                    <td class="col-sm-2 text-right">@money($unpaid_bills, setting('general.default_currency'), true)</td>
                </tr>
                <tr>
                    <th class="col-sm-2" colspan="6" style="padding-left:30px;">Total Bills</th>
                    <th class="col-sm-2  text-right">@money($total_bills, setting('general.default_currency'), true)</th>
                </tr>
                <tr>
                    <th class="col-sm-2" colspan="12" style="padding-left:30px;">Payments</th>
                </tr>
                <tr>
                    <td class="col-sm-2" colspan="6" style="padding-left:60px;">Total Payments</td>
                    <td class="col-sm-2 text-right">@money($total_payments, setting('general.default_currency'), true)</td>
                </tr>
            </tbody>
            <tfoot>
                <tr>
                    <th class="col-sm-2" colspan="6">Total Liability</th>
                    <th class="col-sm-2 text-right">@money($total_liability, setting('general.default_currency'), true)</th>
                </tr>
            </tfoot>
        </table>

        <table class="table table-hover" style="margin-top: 40px">
            <thead>
                <tr>
                    <th class="col-sm-2" colspan="12">Equity</th>
                </tr>
                
            </thead>
            <tbody>
                <tr>
                    <th class="col-sm-2" colspan="6" style="padding-left:30px;">Total Equity</th>
                    <th class="col-sm-2 text-right">@money($total_assets - $total_liability, setting('general.default_currency'), true)</th>
                </tr>
            </tbody>
            <tfoot>
                <!-- <tr>
                    <th class="col-sm-2" colspan="6">Total Equity</th>
                    <th class="col-sm-2 text-right">@money($total_assets - $total_liability, setting('general.default_currency'), true)</th>
                </tr> -->
            </tfoot>
        </table>
    </div>
</div>
