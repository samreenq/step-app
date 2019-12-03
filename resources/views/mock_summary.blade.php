<div class="modal-dialog modal-lg">
    <div class="modal-content">
        <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                <span aria-hidden="true">&times;</span></button>
            <h4 class="modal-title">Quiz Summary</h4>
        </div>


        <form method='post' id="addUpdateMockForm">
            @csrf
            <input type='hidden' id='id' name="id" value="{!! isset($data['id']) ? $data['id'] : '' !!}"/>
            <input type='hidden' name='is_active' value="1"/>
            <div class="modal-body" id="addUpdateMockModalBody">
                <span id="msg"></span>
                <div class="row">
                    <div class="col-sm-12">
                        <label>Title</label>
                        <input type='text' name='title' class='form-control' value="{!! isset($data['title']) ? $data['title'] : '' !!}" required />
                    </div>
                </div>
                <div class="row">
                    <div class="col-sm-12">
                        <label>Description</label>
                        <textarea
                                name='description' class='form-control' required >{!! isset($data['description']) ? $data['description'] : '' !!}</textarea>
                    </div>
                </div>
                <div class="row">
                    <div class="col-sm-12">
                        <label>Duration Seconds</label>
                        <input type='text' name='duration_seconds' class='form-control' value="{!! isset($data['duration_seconds']) ? $data['duration_seconds'] : '' !!}" required />
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