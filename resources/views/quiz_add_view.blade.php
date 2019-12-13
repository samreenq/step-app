<div class="modal-dialog modal-lg">
    <div class="modal-content">
        <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                <span aria-hidden="true">&times;</span></button>
            <h4 class="modal-title">Add Question</h4>
        </div>

        <input type='hidden' id='opt_count' value="2"/>
        <form method='post' id="addForm">
            @csrf
            <div class="modal-body quizModal" id="addModalBody">
                <span id="msg"></span>
                <div class="row">
                    <div class="col-sm-12">
                        <label>Question</label>
                        <input type='hidden' name='topic_id' id="topic_id" value="{!! isset($topic_id) ? $topic_id : "" !!}" />
                        <input type='hidden' name='is_active' value="1"/>
                        <input type='text' name='question' class='form-control' required />
                    </div>
                </div>
                <div class="row" style="padding:15px">
                    <div class="col-sm-12" style="text-align:right">
                        <a href="javascript:;" onclick="addOption('addModalBody');"><i class="fa fa-plus"></i> Add Option</a> |
                        <a href="javascript:;" onclick="remOption();"><i class="fa fa-times"></i> Remove Option</a>
                    </div>
                </div>
                <div class="row">
                    <div class="col-sm-10">
                        <label>Option 1</label>
                        <input type='text' name='option[]' class='form-control'  required />
                        <input type='radio' name='correct' value="0" id="correct0" required />
                        <label for="correct0">Correct Answer</label>
                    </div>
                </div>
                <div class="row">
                    <div class="col-sm-10">
                        <label>Option 2</label>
                        <input type='text' name='option[]' class='form-control'  required />
                        <input type='radio' name='correct' value="1" id="correct1" />
                        <label for="correct1">Correct Answer</label>
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default pull-left" data-dismiss="modal">Close</button>
                <button type="submit" class="btn btn-primary" id="addBtn">Save changes</button>
            </div>
        </form>
    </div>
</div>